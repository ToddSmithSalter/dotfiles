---
name: to-tickets
description: Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocking edges, published as GitLab issues with native blocking links.
disable-model-invocation: true
---

# To Tickets

Break a plan, spec, or conversation into a set of **tickets**: tracer-bullet vertical slices, each declaring the tickets that **block** it.

## GitLab

Tickets are published as GitLab issues. Use the `glab` CLI, which infers the project from `git remote -v` inside a clone. For anything beyond the commands below, call the Skill tool with "gitlab-cli-skills".

- **Create a ticket**: `glab issue create --title "..." --description "..." --label "Feature"`. Use a heredoc for the multi-line description. Repeat `--label` for more than one label.
- **Read an issue**: `glab issue view <n> --comments`. GitLab calls comments "notes".
- **Record a blocking edge**: post the `/blocked_by` quick action as a note, `glab issue note <blocked> --message "/blocked_by #<blocker>"`. This creates GitLab's native blocking link, which the UI shows. Native blocking links are a Premium and Ultimate feature. Where they are unavailable, put a `Blocked by: #<n>, #<n>` line at the top of the description instead.
- **List the frontier**: `glab issue list -F json`, then drop any issue with an open blocker. Read native links with `glab api projects/:id/issues/:iid/links`.

Use Teleo's labels exactly as written, capitals and spaces included. Never create a new label. Never apply `To Do`.

- **Type, exactly one per ticket**: `Feature`, `Refactor`, `Bug`, or `Idea`.
- **Priority, on a `Bug` only, exactly one**: `High Priority`, `Medium Priority`, or `Low Priority`. Never put a priority label on anything else.
- **Area, when it applies**: `CI/CD` or `Devices`.

Tickets are specified by construction, so they never get `Idea` or `To Investigate`.

References: `#42` is issue 42, `!42` is merge request 42. GitLab numbers the two surfaces separately.

## Process

### 1. Gather context

Work from whatever is already in the conversation context. If the user passes a reference (a spec path, an issue number or URL) as an argument, fetch it and read its full body and comments.

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code. Read `CONTEXT.md` (or `CONTEXT-MAP.md` and the per-context files it points to) and the ADRs in `docs/adr/` that touch the area. If those files do not exist, proceed silently. Ticket titles and descriptions should use the project's domain glossary vocabulary, and respect ADRs in the area you're touching.

Look for opportunities to prefactor the code to make the implementation easier. "Make the change easy, then make the easy change."

### 3. Draft vertical slices

Break the work into **tracer bullet** tickets.

<vertical-slice-rules>

- Each slice cuts a narrow but COMPLETE path through every layer (schema, API, UI, tests): vertical, NOT a horizontal slice of one layer
- A completed slice is demoable or verifiable on its own
- Each slice is sized to fit in a single fresh context window
- Any prefactoring should be done first

</vertical-slice-rules>

Give each ticket its **blocking edges**: the other tickets that must complete before it can start. A ticket with no blockers can start immediately.

**Wide refactors are the exception to vertical slicing.** A **wide refactor** is one mechanical change (rename a column, retype a shared symbol) whose **blast radius** fans across the whole codebase, so a single edit breaks thousands of call sites at once and no vertical slice can land green. Don't force it into a tracer bullet; sequence it as **expand–contract**. First expand: add the new form beside the old so nothing breaks. Then migrate the call sites over in batches sized by blast radius (per package, per directory), each batch its own ticket blocked by the expand, keeping CI green batch to batch because the old form still exists. Finally contract: delete the old form once no caller remains, in a ticket blocked by every migrate batch. When even the batches can't stay green alone, keep the sequence but let them share an integration branch that all block a final integrate-and-verify ticket; green is promised only there.

### 4. Quiz the user

Present the proposed breakdown as a numbered list. For each ticket, show:

- **Title**: short descriptive name
- **Blocked by**: which other tickets (if any) must complete first
- **What it delivers**: the end-to-end behaviour this ticket makes work

Ask the user:

- Does the granularity feel right? (too coarse / too fine)
- Are the blocking edges correct: does each ticket only depend on tickets that genuinely gate it?
- Should any tickets be merged or split further?

Iterate until the user approves the breakdown.

### 5. Publish the tickets to GitLab

Publish one GitLab issue per ticket, in dependency order so blockers exist first and each blocking edge can name a real issue number.

Record each edge as a native blocking link with the `/blocked_by` quick action. Where native links are unavailable, use the `Blocked by:` line described above. Give each ticket the type label that matches its work, plus a priority label if it is a `Bug`. The tickets are agent-grabbable by construction.

Work the **frontier**: any ticket whose blockers are all done. For a purely linear chain that means top to bottom.

Do NOT close or modify any parent issue.

<issue-template>

## Parent

A reference to the parent issue on the tracker (if the source was an existing issue, otherwise omit this section).

## What to build

The end-to-end behaviour this ticket makes work, from the user's perspective, not layer-by-layer implementation.

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2

## Blocked by

- A reference to each blocking ticket, or "None (can start immediately)".

</issue-template>

Avoid specific file paths or code snippets: they go stale fast. Exception: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it and note briefly that it came from a prototype. Trim to the decision-rich parts, not a working demo, just the important bits.
