# ByteLord rules (pointer)

Rich's rules for every AI coding agent on ByteLord (Claude Code, Codex and Cursor) apply in this
repo. They live in one file, `/home/bytecave/.claude/AGENTS.md`. Read it at the start of every
session and follow it: its sections on tests, Agent Mail, Supermemory, graphify and Markdown file
size all apply here.

**Tests, in short (Rich, 2026-10-07):**
- **Never run a test without Rich's explicit go-ahead in the conversation:** no suite and no single
  test.
- Record what needs testing in `/opt/bytelord/TESTS_TO_RUN.md`, and keep that file current.
- Remind Rich when it lists tests.
- When he says go, run exactly those and remove the entries that passed.

This file is a pointer, not a copy: change the rules only in `/home/bytecave/.claude/AGENTS.md`.
