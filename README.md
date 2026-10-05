# harness-bakeoff-fixture

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**A tiny, throwaway repository for pointing coding-agent harnesses at
something real without risking anything real.**

When you compare agent harnesses, every contender needs the same starting
point: a small, ordinary repo with clear instructions, a validation command,
a task template, and a list of paths that are off-limits. This is that
starting point, and nothing more.

> **This is a fixture, not a product.** It does no work on its own, has no
> users, and nothing in it is production code. Clone it, let an agent change
> it, compare the results, and throw the clone away.

## What it is

| Piece | File | What it gives a harness |
| --- | --- | --- |
| Agent guide | [`AGENTS.md`](AGENTS.md) | The entry point an agent reads first |
| Validation gate | [`scripts/validate.sh`](scripts/validate.sh) via `make validate` | One offline command with a clear pass/fail |
| Task template | [`.github/ISSUE_TEMPLATE/agent-task.yml`](.github/ISSUE_TEMPLATE/agent-task.yml) | Goal, "done when" and safety checkboxes for each task |
| Off-limits paths | [`agent/sensitive-paths.yml`](agent/sensitive-paths.yml) | Glob patterns an agent must not touch (`.env`, keys, credentials) |
| Testing notes | [`docs/testing.md`](docs/testing.md) | What the gate checks and what it doesn't |
| House rules | [`CONTRIBUTING.md`](CONTRIBUTING.md), [`SECURITY.md`](SECURITY.md) | Small reversible changes, no secrets, private reporting |

## What it isn't

- Not a harness, benchmark or scoring system. It doesn't run agents or rate
  them.
- Not production software, and it doesn't certify any agent, model or tool.
- Not a place for secrets or personal data, real or otherwise. Treat
  everything in it as synthetic.
- Not a results archive. No bakeoff results are stored here.

## Quick start

```bash
git clone https://github.com/T-Py-T/harness-bakeoff-fixture.git
cd harness-bakeoff-fixture
make validate
```

On macOS this printed `validate: ok` and exited 0. The gate needs no network
and no extra tools. It checks that the required files exist and that the
validation script parses (`bash -n`).

## Use it in a bakeoff

1. **Clone fresh for every run** so each harness starts from the same commit.
2. **Write the task** with the agent-task template: a goal, an observable
   "done when", and the two safety boxes ticked.
3. **Point the harness at the clone.** It should read `AGENTS.md`, respect
   `agent/sensitive-paths.yml`, and finish with `make validate` passing.
4. **Compare and discard.** Keep the diffs and logs somewhere else, then
   delete the clone.

## Extend it

If a bakeoff needs more surface (a failing test to fix, a small library, a
doc to rewrite), add it on a branch of your own clone and keep it small. If
you add files the gate should require, add them to the `required` list in
`scripts/validate.sh`.

## Contributing

Keep changes small and reversible, run `make validate` before opening a pull
request, and never commit secrets, tokens or personal data. See
[CONTRIBUTING.md](CONTRIBUTING.md). Report anything sensitive privately as
described in [SECURITY.md](SECURITY.md).

The default branch is `new/phase0-readiness-skeleton`; there is no `main`
branch.

## License

[MIT](LICENSE).
