# Contributing to ex_asana

Thanks for contributing.

## Development setup

1. Use Elixir `~> 1.18` and OTP `27`.
2. Install dependencies:

   ```bash
   mix deps.get
   ```

3. Run tests:

   ```bash
   mix test
   ```

4. Run the fast local quality suite:

   ```bash
   mix ci.fast
   ```

5. Run the full suite before release-level changes:

   ```bash
   mix ci
   ```

## Branches and pull requests

1. Branch from `master`.
2. Keep PRs focused and small when possible.
3. Add or update tests for behavior changes.
4. Update docs when API behavior changes.
5. Ensure CI passes (`Test and Lint`, `Dialyzer`).

## Commit guidance

- Use clear, imperative commit messages.
- Keep unrelated changes in separate commits.

## OpenAPI/spec changes

For Asana spec refresh and regeneration workflow, follow:

- `guides/spec_update_workflow.md`

## Release process

1. Update `version` in `mix.exs`.
2. Update `CHANGELOG.md`.
3. Merge to `master`.
4. Tag release as `vX.Y.Z`.
5. Push the tag:

   ```bash
   git push origin vX.Y.Z
   ```

The `Publish Hex` workflow handles Hex.pm publication.
