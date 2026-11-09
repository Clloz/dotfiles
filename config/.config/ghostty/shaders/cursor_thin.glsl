 // Ghostty Thin Cursor Trail
 // Minimal tapered cursor motion indicator

 // --- Configuration ---
 //
 // Animation
const float DURATION = 0.24;
const float MIN_MOVE_DISTANCE = 0.5;
const float MAX_TRAIL_LENGTH = 10.0;

// Thickness
const float HEAD_THICKNESS = 0.65;
const float TAIL_THICKNESS = 0.18;

// Opacity
const float TRAIL_OPACITY = 0.95;
const float FADE_EXPONENT = 0.8;

// Antialiasing
const float EDGE_SOFTNESS = 0.75;

 // --- Color conversion ---

 vec3 sRGBToLinear(vec3 c) {
     return mix(
         c / 12.92,
         pow((c + 0.055) / 1.055, vec3(2.4)),
         step(vec3(0.04045), c)
     );
 }

 // --- Helpers ---

 float easeOutCubic(float t) {
     t = clamp(t, 0.0, 1.0);
     return 1.0 - pow(1.0 - t, 3.0);
 }

 // Cursor rectangle center in pixel coordinates.
 // Matches Ghostty's cursor coordinate convention.
 vec2 cursorCenter(vec4 cursor) {
     return cursor.xy +
            vec2(cursor.z * 0.5, -cursor.w * 0.5);
 }

 float rectMask(vec2 p, vec2 center, vec2 halfSize) {
     vec2 d = abs(p - center) - halfSize;
     float sdf = length(max(d, 0.0))
               + min(max(d.x, d.y), 0.0);

     return 1.0 - smoothstep(
         -EDGE_SOFTNESS,
         EDGE_SOFTNESS,
         sdf
     );
 }

 // --- Main shader ---

 void mainImage(
     out vec4 fragColor,
     in vec2 fragCoord
 ) {
     vec2 uv = fragCoord / iResolution.xy;
     vec4 original = texture(iChannel0, uv);

     fragColor = original;

     vec4 current = iCurrentCursor;
     vec4 previous = iPreviousCursor;

     vec2 head = cursorCenter(current);
     vec2 oldCenter = cursorCenter(previous);

     vec2 movement = head - oldCenter;
     float distanceMoved = length(movement);

     float cursorHeight = max(current.w, 1.0);

     // Ignore tiny movements.
     if (distanceMoved <
         cursorHeight * MIN_MOVE_DISTANCE) {
         return;
     }

     float elapsed = max(
         iTime - iTimeCursorChange,
         0.0
     );

     if (elapsed >= DURATION) {
         return;
     }

     float progress = clamp(
         elapsed / DURATION,
         0.0,
         1.0
     );

     // float eased = easeOutCubic(progress);
     float eased = progress * progress * (3.0 - 2.0 * progress);

     // Limit trail length for large jumps.
     vec2 direction = movement /
                      max(distanceMoved, 0.001);

     float maxLength =
         cursorHeight * MAX_TRAIL_LENGTH;

     float trailLength = min(
         distanceMoved,
         maxLength
     );

     vec2 trailStart =
         head - direction * trailLength;

     // Tail approaches current cursor over time.
     vec2 tail = mix(
         trailStart,
         head,
         eased
     );

     vec2 segment = head - tail;

     float segmentLengthSq =
         dot(segment, segment);

     if (segmentLengthSq < 0.0001) {
         return;
     }

     // Projection along the trail:
     // 0 = tail, 1 = cursor.
     float t = clamp(
         dot(fragCoord - tail, segment) /
         segmentLengthSq,
         0.0,
         1.0
     );

     vec2 closest = tail + segment * t;

     float perpendicularDistance =
         length(fragCoord - closest);

     // Base thickness depends on movement direction.
     // Horizontal movement -> use cursor height.
     // Vertical movement -> use cursor width.
     vec2 normal = vec2(-direction.y, direction.x);

     float baseThickness =
         abs(normal.x) * current.z +
         abs(normal.y) * current.w;

     // Taper from thin tail to wider head.
     float thicknessFactor = mix(
         TAIL_THICKNESS,
         HEAD_THICKNESS,
         smoothstep(0.0, 1.0, t)
     );

     float halfWidth =
         baseThickness * thicknessFactor * 0.5;

     // Antialiased shape.
     float shape = 1.0 - smoothstep(
         halfWidth - EDGE_SOFTNESS,
         halfWidth + EDGE_SOFTNESS,
         perpendicularDistance
     );

     // Transparent at tail, stronger near cursor.
     float spatialFade =
         pow(t, FADE_EXPONENT);

     // Fade entire trail as animation finishes.
     float temporalFade =
         1.0 - smoothstep(0.82, 1.0, progress);

     float alpha =
         shape *
         spatialFade *
         temporalFade *
         TRAIL_OPACITY *
         iCurrentCursorColor.a;

     vec3 trailColor = sRGBToLinear(
         iCurrentCursorColor.rgb
     );

     // Keep original framebuffer alpha.
     vec3 result = mix(
         original.rgb,
         trailColor,
         clamp(alpha, 0.0, 1.0)
     );

     // Do not paint over current cursor.
     float cursorMask = rectMask(
         fragCoord,
         head,
         current.zw * 0.5
     );

     result = mix(
         result,
         original.rgb,
         cursorMask
     );

     fragColor = vec4(result, original.a);
 }

