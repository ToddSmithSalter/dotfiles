---
name: implement
description: "Implement a piece of work based on a GitLab spec issue or set of ticket issues."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

## Resolve the reference first

A bare number is ambiguous: it can match a todo file or a checklist in the session instead of the tracker. Resolve every reference against GitLab, then confirm the title back to the user before you write any code.

- **Fetch an issue**: `glab issue view <n> --comments`. GitLab calls comments "notes".
- `#42` is issue 42. `!42` is merge request 42.
- For a set of tickets, fetch each one, and work the **frontier**: any ticket whose blockers are all closed. Read blocking links with `glab api projects/:id/issues/:iid/links`, or the `Blocked by:` line in the description.

`glab` infers the project from `git remote -v` inside a clone. For anything beyond these commands, call the Skill tool with "gitlab-cli-skills".

## Build

Use /tdd where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, use /code-review to review the work.

Commit your work to the current branch.

## Close out

Do not close the issue yourself unless the user asks. When they do want it closed, post the outcome first (`glab issue note <n> --message "..."`), then `glab issue close <n>`, because `glab issue close` accepts no closing comment.

Open a merge request only when the user asks: `glab mr create`.
