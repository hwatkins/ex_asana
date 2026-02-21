# Spec Update Workflow

Use this when Asana updates their OpenAPI spec and you want to pull changes
without losing custom library code.

## One Command (Recommended)

```bash
mix api.refresh.asana
```

This runs:

1. Download latest Asana spec into `priv/openapi/asana.yaml`
2. Regenerate modules via `mix api.gen.asana`
3. Run `mix ci.fast`

## Full CI Variant

```bash
mix asana.refresh_spec --ci-task ci
```

## Skip CI (Faster local iteration)

```bash
mix asana.refresh_spec --no-ci
```

## Custom Spec URL or Output Path

```bash
mix asana.refresh_spec \
  --source-url https://raw.githubusercontent.com/Asana/openapi/master/defs/asana_oas.yaml \
  --output priv/openapi/asana.yaml
```

## Why this is safe for custom code

- Generated code lives in `lib/asana/generated/**` and is treated as disposable.
- Custom wrappers/decoding live outside generated modules (`lib/asana/*.ex`).
- Tests catch spec drift after regeneration.
