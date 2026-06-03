---
name: create-gitlab-issue
description: Create well-structured Gitlab issues using glab CLI. Use when asked to create, file, open, or write up a Gitlab issue. Gathers context from the conversation or by asking questions, then files an issue with a user story, description, acceptance criteria, and the right labels. Requires glab CLI authenticated and repo cloned locally.
---

# Gitlab Issue Creator

Create clear, actionable Gitlab issues from a consistent template.

## Prerequisites

- `glab` CLI installed and authenticated
- Repository cloned locally (so the issue targets the correct project)

## Workflow

### 1. Gather Context

Draw on the current conversation first. Fill any gaps by asking the user. You need enough to write each template section, plus the correct labels.

Ask only for what is missing. Likely questions:
- Who is this for and what do they want to accomplish? (user story)
- What needs to be built or changed?
- How do we know it is done? (acceptance criteria)
- Is this a feature, refactor, bug, idea, or something to investigate?
- If a bug: what is the priority (low, medium, high)?
- Anything explicitly out of scope?

### 2. Choose Labels

Pick exactly one type label:

- `Feature`
- `Refactor`
- `Bug`
- `Idea`
- `To Investigate`

If the type is `Bug`, also add exactly one priority label:

- `Low Priority`
- `Medium Priority`
- `High Priority`

Confirm the labels exist in the project before filing:

```bash
glab label list
```

If a needed label is missing, create it:

```bash
glab label create --name "High Priority" --color "#d9534f"
```

### 3. Draft the Issue Body

Use this template. Omit optional sections (Technical Notes, Out of Scope, Additional Notes) when they add nothing.

```markdown
## User Story
As a <role>, I want <capability> so that <benefit>.

## Description
<What to build or change, and why. Enough for someone else to pick it up cold.>

## Acceptance Criteria
- [ ] <Observable, testable condition>
- [ ] <Observable, testable condition>

## Technical Notes
<Optional. Implementation hints, relevant files, constraints, dependencies.>

## Out of Scope
<Optional. What this issue explicitly does not cover.>

## Additional Notes
<Optional. Links, references, screenshots, related issues.>
```

### 4. Review With the User

Show the drafted title, body, and labels. Get confirmation (or edits) before filing.

### 5. Create the Issue

```bash
glab issue create \
  --title "<concise, specific title>" \
  --label "Feature" \
  --description "$(cat <<'EOF'
## User Story
As a <role>, I want <capability> so that <benefit>.

## Description
...

## Acceptance Criteria
- [ ] ...
EOF
)"
```

For a bug, pass both labels:

```bash
glab issue create --title "..." --label "Bug,High Priority" --description "..."
```

### 6. Confirm

Report the created issue URL back to the user.

```bash
glab issue view <issue-number>
```

## Quick Reference

```bash
# List labels to verify they exist
glab label list

# Create a feature issue
glab issue create --title "Add export to CSV" --label "Feature" --description "..."

# Create a bug with priority
glab issue create --title "Login fails on Safari" --label "Bug,Medium Priority" --description "..."

# View the result
glab issue view 123
```

## Notes

- One type label per issue; priority label only for bugs.
- Keep titles concise and specific. The body carries the detail.
- Acceptance criteria should be observable and testable, not vague.
- Never mention Claude Code in issue descriptions or comments.
