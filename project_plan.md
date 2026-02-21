Why pagination as Streams
Asana's API returns paginated results with a next_page.offset cursor. Without streams, callers have to manually loop through pages. With Elixir Streams, you wrap that pagination logic so the caller just gets a lazy enumerable:
elixirAsana.Tasks.list(client, project_gid)
|> Enum.take(5)        # only fetches the first page
|> Enum.to_list()

Asana.Tasks.list(client, project_gid)
|> Stream.filter(&(&1.completed))
|> Enum.count()         # fetches all pages, but lazily
The caller never thinks about pagination. Pages are fetched on demand — if they only need 5 results, only one API call happens. If they need everything, it transparently walks through all pages. It also composes naturally with the rest of Elixir's Enum/Stream ecosystem. It's one of those things that makes a library feel native to the language.

The Plan
Phase 1 — Scaffold & Generate (Day 1)

Create the mix project (mix new asana --module Asana)
Add oapi_generator and req as deps
Grab Asana's OpenAPI spec (they publish one on GitHub)
Configure oapi_generator with proper module naming (Asana.Tasks, Asana.Projects, etc.)
Run mix api.gen and review what you get — fix any naming quirks via the generator's config (renaming, merging, ignoring schemas)

Phase 2 — Client Core (Day 1-2)

Write Asana.Client implementing request/1 with Req
Handle bearer token auth, with support for passing tokens per-request or via application config
Add JSON decoding and structured error responses ({:ok, result} / {:error, %Asana.Error{}})
Add retry middleware for 429s using Retry-After header
Basic integration test against the real API to verify the happy path works

Phase 3 — Pagination Streams (Day 2-3)

Implement Stream.resource/3 based pagination that follows next_page.offset
Wrap all list operations to return streams by default
Add opt_fields support as a clean option on every call

Phase 4 — Polish (Day 3-5)

Write @moduledoc and @doc with real usage examples for the most common resources (tasks, projects, workspaces, users)
Add a getting-started guide in the guides/ folder
Set up ExUnit tests with Bypass or Tesla.Mock for offline testing
Add typespecs review — make sure dialyzer is happy
CI with GitHub Actions (test, credo, dialyzer)

Phase 5 — Publish & Extras (Day 5+)

Publish to Hex
Add webhook support (a Plug for receiving and verifying Asana webhook events) if you need it
Consider a lightweight convenience layer for common workflows (e.g., Asana.Tasks.complete/2 as a shortcut for updating the completed field)

This gets you a working, published library in roughly a week, with most of the tedious struct/function boilerplate handled by the generator and your effort focused on the parts that actually matter.
