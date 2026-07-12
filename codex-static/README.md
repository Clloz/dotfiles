# Codex Static Configuration

This Stow package contains Codex configuration files that are authored manually and intended to be synchronized across machines.

## Managed files

Typical contents include:

```text
.codex/
├── AGENTS.md
├── profiles/
├── rules/
└── skills/
```

These files are treated as static, user-maintained configuration.

The package intentionally does not contain:

```text
.codex/config.toml
```

Codex and the ChatGPT desktop application may modify `~/.codex/config.toml` automatically. Keeping that file outside Stow prevents machine-specific state and generated settings from being committed to the dotfiles repository.

## Installation

From the dotfiles repository:

```bash
cd ~/dotfiles
stow codex-static
```

This creates symbolic links under:

```text
~/.codex/
```

For example:

```text
~/.codex/profiles -> ~/dotfiles/codex-static/.codex/profiles
```

## Updating files

Edit the source files directly:

```bash
nvim ~/dotfiles/codex-static/.codex/profiles/review.toml
```

Because the deployed files are symbolic links, changes take effect immediately. Running Stow again is not normally required.

When files or top-level directories are added or removed, restow the package:

```bash
cd ~/dotfiles
stow -R codex-static
```

## Removing links

To remove links created by this package:

```bash
cd ~/dotfiles
stow -D codex-static
```

This removes the symbolic links but does not delete the files stored in the dotfiles repository.

## Configuration ownership

Use this package for configuration that should be:

- portable across machines;
- reviewed and committed to Git;
- edited manually;
- stable across Codex upgrades.

Machine-generated or machine-specific state belongs in the local `~/.codex/config.toml` file and must not be added to this package.
