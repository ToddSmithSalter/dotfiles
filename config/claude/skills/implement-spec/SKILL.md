---
name: implement-spec
description: "Implement the result of /to-spec and /to-tickets in code."
disable-model-invocation: true
---

You have been provided a spec. This spec should have tickets associated with it, describing how to implement the spec.

The goal is the entire spec implemented on a single **integration branch**, with every ticket closed by a merge request.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed.

Each ticket has a **mode** in its description. **AFK** tickets go to subagents. **HITL** (human in the loop) tickets go to the user, because they need a decision, access, or verification that only a person can give.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the spec, tickets, research notes, and previous commits. Don't duplicate information already available via pointers.

An **implementer subagent** is the `implementer` agent type (`subagent_type: implementer`). Its definition holds its per-ticket duties, so pass it pointers: the ticket, the spec, the integration branch, and any research notes. Run implementer subagents in the background where possible for maximum concurrency.

The `implementer` agent runs at low effort. When one fails a ticket for a reason other than needing a person, run that ticket once more with `effort: high`.

## GitLab

The spec and tickets are GitLab issues. Use the `glab` CLI, which infers the project from `git remote -v` inside a clone. For anything beyond the commands below, call the Skill tool with "gitlab-cli-skills".

- **Read an issue**: `glab issue view <n> --comments`. GitLab calls comments "notes".
- **Read blocking links**: `glab api projects/:id/issues/:iid/links`, or the `Blocked by:` line in the description.
- **Open a draft merge request**: `glab mr create --draft --source-branch <integration-branch> --target-branch master --title "..." --description "..."`. Target the project's default branch.

References: `#42` is issue 42, `!42` is merge request 42. GitLab numbers the two surfaces separately. A bare number is ambiguous, so resolve every reference against GitLab and confirm the spec title back to the user before you start.

## Steps

1. Read the spec and tickets to understand the task graph. Note the mode of each ticket. If a ticket has no mode, treat it as HITL and ask the user.

2. (optional) Use an **exploration subagent** to conduct any exploration required by the tickets - relevant codebase files or external documentation. Ensure the exploration subagent can save files - it should save its markdown notes in a directory outside the repo, accessible by all future subagents. This lets **implementer subagents** focus on implementation rather than exploration.

3. Create the integration branch. After the first merge in step 6, open a draft merge request from it (a branch with no commits ahead of the default branch can't open one). Put a `Closes #<n>` line in its description for the spec and for each ticket, so merging it closes them all.

4. Use **implementer subagents** to implement each AFK ticket on the frontier, each in its own worktree on its own branch. If an implementer subagent reports that it cannot finish without a person, treat that ticket as HITL from then on.

5. For each HITL ticket on the frontier, tell the user what the ticket needs from them and why. Keep the AFK work moving while you wait. When the user has done their part, finish any remaining code for that ticket with an implementer subagent.

6. Once an **implementer subagent** completes, merge its work to the integration branch with a **merger subagent**.

7. If this changes the **frontier** of available tickets, kick off more **implementer subagents** on the new AFK tickets, and raise any new HITL tickets with the user. This allows for maximum concurrency.

8. Once all tickets are complete, call the Skill tool with `code-review` on the integration branch. Fix all issues raised by the code review in a single **implementer subagent**.

9. Mark the draft merge request ready for review with `glab mr update <n> --ready`. Do not merge it, and do not close any issue yourself. Report the merge request and the integration branch.

10. Clean up all **implementer subagent** worktrees.
