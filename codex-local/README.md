# Codex Local Configuration

This directory contains the bootstrap configuration for the machine-local Codex configuration file:

```text
~/.codex/config.toml
```

It is not a GNU Stow package and must not be deployed with `stow`.

## Purpose

Codex and the ChatGPT desktop application may automatically modify `~/.codex/config.toml`.

Generated or machine-specific sections may include:

- trusted project paths;
- plugin marketplace state;
- desktop application preferences;
- model onboarding state;
- Computer Use runtime configuration;
- application paths and version-specific hashes.

For this reason, the live `config.toml` must remain a normal local file rather than a symbolic link into the dotfiles repository.

## Files

```text
codex-local/
├── config.base.toml
├── install.sh
└── README.md
```

### `config.base.toml`

This file contains the portable initial configuration for a new machine.

It should contain stable settings such as:

- the default model;
- reasoning effort;
- sandbox mode;
- approval policy;
- personality;
- manually configured remote MCP servers;
- intentionally enabled plugins.

It should not contain generated or machine-specific sections such as:

```toml
[projects.*]
[tui.model_availability_nux]
[marketplaces.*]
[desktop]
[mcp_servers.node_repl]
[mcp_servers.computer-use]
```

### `install.sh`

The installation script copies `config.base.toml` to:

```text
~/.codex/config.toml
```

only when the target file does not already exist.

The script deliberately refuses to overwrite an existing configuration or a symbolic link.

## Initial installation

Run once on a new machine:

```bash
cd ~/dotfiles
./codex-local/install.sh
```

After the file has been created, Codex owns the live local configuration and may append machine-specific state.

Do not run the script again to apply routine changes.

## Updating configuration

For settings that should affect the current machine, edit:

```bash
nvim ~/.codex/config.toml
```

For stable settings that should also become defaults on future machines, make the same intentional change in:

```bash
nvim ~/dotfiles/codex-local/config.base.toml
```

Then commit only the base template:

```bash
cd ~/dotfiles
git add codex-local/config.base.toml
git commit -m "update Codex base configuration"
```

The base template is a bootstrap source, not a continuously synchronized source of truth.

## Relationship with `codex-static`

The `codex-static` Stow package manages files that should remain synchronized:

```text
~/.codex/profiles
~/.codex/rules
~/.codex/skills
~/.codex/AGENTS.md
```

This directory manages only the initial template for the local mutable file:

```text
~/.codex/config.toml
```

The two directories intentionally use different deployment strategies because their files have different ownership and lifecycles.
