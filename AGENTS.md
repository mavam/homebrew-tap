# Mavam’s Homebrew tap

This repository publishes Homebrew formulae under `mavam/tap`.

## Formulae

- Keep formulae in `Formula/<name>.rb`.
- Prefer immutable upstream release archives and verify their SHA-256 checksums.
- For npm applications, use the published registry tarball, declare `node`, and
  install with Homebrew’s `std_npm_args`. Keep lifecycle scripts disabled.
- Add offline functional tests. Tests must not need credentials or make billable
  provider requests.
- Keep README instructions user-facing. The formula name and installed command
  can differ; Webfox installs `web`.

## Validation

Run these checks before committing formula changes:

```sh
brew style Formula
brew audit --strict --tap=mavam/tap
brew install --build-from-source mavam/tap/webfox
brew test mavam/tap/webfox
```

Use `brew reinstall --build-from-source` if the formula is already installed.
Run `actionlint` when changing GitHub Actions workflows.

## Updates

The `Update formulae` workflow runs daily or through `workflow_dispatch`. It
uses `brew bump` to open release update pull requests. It also dispatches
`Test formulae` for bot-created pull requests because `GITHUB_TOKEN` events
otherwise don't trigger pull-request checks.

Automation uses only the repository’s `GITHUB_TOKEN`; no personal token is
needed. Keep default workflow permissions read-only, and allow GitHub Actions
to create pull requests in the repository settings. Formula updates become
public after the update pull request is merged.
