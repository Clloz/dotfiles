# Codex Task

## Objective

Implement the map checking workflow in
`src/layouts/groupManage/mapCheckMapChecking.vue`.

The page should continuously send navigation goals until all testing points are completed.

---

## Relevant files

Entry

- src/layouts/groupManage/mapCheckMapChecking.vue

Reference

- src/hooks/pointManage/move.ts

Store

- src/store/modules/point.ts

API

- src/api/ros/constant.ts

Please inspect only files directly related to this task.
Avoid exploring unrelated modules unless necessary.

---

## Background

The existing navigation implementation in `move.ts` already contains the required ROS APIs.

However, it mixes multiple responsibilities and is difficult to reuse.

This page should have its own navigation workflow implementation instead of reusing `move.ts` directly.

---

## Requirements

When the user clicks **Start Test**:

1. Collect testing points.

   Currently, use all points whose type is `normal` or `origin`.

   The point list is available from

   `pointStore.getCurPoint`.

2. Send

   `mapCheckAction(true)`.

3. Subscribe
   - changeGoal
   - subscribeNavigationState

4. Send the first navigation goal using

   `operationNavigationDst`.

5. When receiving either
   - changeGoal == true
   - navigationState == 68

   continue with the next testing point.

6. Repeat until every testing point has been visited.

7. After the final testing point,

   send the first point again so the robot returns to the origin.

8. The return-to-origin task MUST wait for

   `navigationState == 68`.

   `changeGoal` must NOT finish the workflow.

9. After returning to origin,
   - show success message
   - send mapCheckAction(false)
   - unsubscribe all topics

Timeout:

- If no changeGoal or navigationState is received within 5 minutes,
  consider the current task failed.
- Continue with the next testing point.

---

## Constraints

- Do not reuse `move.ts` directly.
- Reuse only necessary ROS API wrappers.
- Keep the Vue component focused on UI.
- Extract navigation workflow into reusable logic.
- Prefer an event-driven state machine.
- Properly clean up subscriptions and timers.

---

## Expected approach

Do NOT modify any code yet.

Please:

1. Read the relevant code.
2. Explain your understanding.
3. Propose the implementation architecture.
4. Point out any potential edge cases.
5. Wait for my confirmation.

---

## Acceptance Criteria

- All testing points are visited.
- Robot returns to origin.
- Timeout does not stop the workflow.
- mapCheckAction(false) is always sent.
- All subscriptions are cleaned up.
- No duplicated navigation tasks are generated.
