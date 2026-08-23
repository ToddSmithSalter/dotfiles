---
name: to-spec
description: "Turn the current conversation into a spec and publish it as a GitLab issue: no interview, just synthesis of what you've already discussed."
disable-model-invocation: true
---

This skill takes the current conversation context and codebase understanding and produces a spec. Do NOT interview the user; just synthesize what you already know.

## GitLab

The spec is published as a GitLab issue. Use the `glab` CLI, which infers the project from `git remote -v` inside a clone. For anything beyond the commands below, call the Skill tool with "gitlab-cli-skills".

- **Create the issue**: `glab issue create --title "..." --description "..."`. Use a heredoc for the multi-line description.
- **Apply the labels**: `glab issue update <n> --label "Feature"`, or pass `--label` on create. Repeat the flag for more than one label.
- **Read an existing issue**: `glab issue view <n> --comments`. GitLab calls comments "notes".

Use Teleo's labels exactly as written, capitals and spaces included. Never create a new label. Never apply `To Do`.

- **Type, exactly one**: `Feature` (a new feature), `Refactor` (a code refactor), `Bug` (something broken), or `Idea` (still needs discussion).
- **Priority, on a `Bug` only, exactly one**: `High Priority`, `Medium Priority`, or `Low Priority`. Never put a priority label on anything else.
- **Area, when it applies**: `CI/CD` or `Devices`.

A spec is specified by construction, so it never gets `Idea` or `To Investigate`.

## Process

1. Explore the repo to understand the current state of the codebase, if you haven't already. Read `CONTEXT.md` (or `CONTEXT-MAP.md` and the per-context files it points to) and the ADRs in `docs/adr/` that touch the area. If those files do not exist, proceed silently. Use the project's domain glossary vocabulary throughout the spec, and respect any ADRs in the area you're touching.

2. Sketch out the seams at which you're going to test the feature. Existing seams should be preferred to new ones. Use the highest seam possible. If new seams are needed, propose them at the highest point you can. The fewer seams across the codebase, the better - the ideal number is one.

Check with the user that these seams match their expectations.

3. Write the spec using the template below, then publish it as a GitLab issue. Apply the type label that matches the work, plus a priority label if it is a `Bug`. No further triage is needed.

## Length

A human reads this spec to decide whether the feature is the right feature. Write for that reader.

- Keep the whole spec under roughly 500 words, not counting an inlined snippet.
- Write **Problem Statement** and **Solution** as one short paragraph each.
- Cut a section entirely when the conversation gives it nothing. An empty heading is worse than no heading. **Problem Statement**, **Solution**, and **User Stories** are the only sections that must always appear.
- Do not restate the same point in two sections.

<spec-template>

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A numbered list of **at most 10** user stories, ordered by impact. Fewer is better. Each one reads:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

This list is for a human reader, not for an agent. It exists so the reader can decide whether the feature is the right feature. Pick the stories that a developer needs to build the feature as the conversation defined it. If the conversation only justifies four stories, write four.

Include a story only when it changes what gets built:

- Keep the stories that name a distinct actor, a distinct outcome, or a decision the reader could disagree with.
- Drop CRUD variants of one idea. One story covers create, edit, and delete of the same thing.
- Drop error paths, empty states, validation rules, and permission checks. They belong in **Implementation Decisions**, or nowhere.
- Drop anything that restates the **Solution** section in story form.
- Never split one story into sub-stories or lettered parts.

## Implementation Decisions

A short list of the decisions that the conversation actually settled. Do not invent decisions to fill the section. This can include:

- The modules that will be built/modified
- The interfaces of those modules that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- API contracts
- Specific interactions

Do NOT include specific file paths or code snippets. They may end up being outdated very quickly.

Exception: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it within the relevant decision and note briefly that it came from a prototype. Trim to the decision-rich parts, not a working demo, just the important bits.

## Testing Decisions

A list of testing decisions that were made. Include:

- A description of what makes a good test (only test external behavior, not implementation details)
- Which modules will be tested
- Prior art for the tests (i.e. similar types of tests in the codebase)

## Out of Scope

A description of the things that are out of scope for this spec.

## Further Notes

Any further notes about the feature.

</spec-template>
