# Journal Entry Creation Instructions

**Purpose:** This document provides step-by-step instructions for Claude Code to create daily journal entries for the octattoo.app project.

---

## Overview

The `octattoo_journey/` folder contains daily development journal entries that document the evolution of the octattoo.app project. Each entry reviews the commits made since the last journal entry, explains the reasoning behind changes, and documents architectural decisions.

---

## Journal Entry Structure

Each journal entry follows this format:

```markdown
# Day [NUMBER]: [Topic/Focus Area]

**Date:** [Month Day, Year]
**Author:** FLLAN
**Branch:** `[Branch Name]`

---

## Notes

**For tattoo artists:** [Explain changes in non-technical terms]

**For technophiles:** [Add technical references, links to docs, or implementation patterns]

---

## Summary

[1-2 sentence overview of what was accomplished this day]

---

## Added

### [Category 1]
- ✅ [Description] ([`commit-hash`](https://github.com/Fllan/octattoo.app/commit/commit-hash))
- ✅ [Description with details] ([`commit-hash`](https://github.com/Fllan/octattoo.app/commit/commit-hash))
  - Sub-detail if needed
  - Another sub-detail

### [Category 2]
- ✅ [Description] ([`commit-hash`](https://github.com/Fllan/octattoo.app/commit/commit-hash))

---

## Technical Implementation

[Detailed explanation of how things were implemented, including:]
- Technical architecture
- Code structure
- Design patterns used
- Integration details

Include code snippets or ASCII diagrams where helpful.

---

## Architecture Decisions

[Explain WHY specific choices were made:]

**[Decision title]**
- Reason 1
- Reason 2
- Trade-offs considered
- Benefits of chosen approach

**[Another decision]**
- Reasoning...

---

**🖤 Made with dedication for the tattoo community**
```

---

## Step-by-Step Process

### 1. Identify the Date Range

First, determine which commits to review:

```bash
# Get the date of the last journal entry
ls -lt octattoo_journey/*.md

# Find commits since that date
git log --since="YYYY-MM-DD" --oneline --all
```

Or identify commits between last journal entry and now:
```bash
# Find commits after a specific commit mentioned in last journal
git log <last-documented-commit-hash>..HEAD --oneline
```

### 2. Analyze Each Commit

For each commit identified:

```bash
# View commit details
git show <commit-hash>

# Or get a summary
git log <commit-hash> -1 --stat
```

**What to extract:**
- What files were changed
- What functionality was added/modified/removed
- Why the change was made (from commit message and code analysis)
- How it fits into the broader architecture

### 3. Group Commits by Category

Organize commits into logical categories such as:
- Project Structure
- Documentation
- Backend Setup
- Frontend Development
- Navigation System
- UI Components
- Features (Customers, Appointments, etc.)
- Configuration/Settings
- Code Organization
- Bug Fixes
- Performance Improvements

### 4. Write the Summary

Create a concise 1-2 sentence summary that captures:
- The main focus of the day's work
- Key accomplishments
- Overall progress direction

### 5. Document Technical Implementation

Explain HOW things were built:
- Architecture patterns used
- Code structure and organization
- Technical integration details
- Dependencies and relationships

Use diagrams or code structure examples where helpful.

### 6. Document Architecture Decisions

Explain WHY specific choices were made:
- What problem was being solved
- What alternatives were considered
- Why this approach was chosen
- Trade-offs and benefits

### 7. Add Notes for Different Audiences

- **For tattoo artists:** Explain in simple, non-technical terms what the changes mean for the end user
- **For technophiles:** Add technical references, documentation links, or implementation patterns used

---

## Formatting Guidelines

### Commit References
Always link commits in this format:
```markdown
([`commit-hash`](https://github.com/Fllan/octattoo.app/commit/commit-hash))
```

Use the first 7 characters of the commit hash.

### Checkboxes
Use ✅ for completed items in the "Added" section.

### Code Blocks
Use code fences with language specification:
````markdown
```dart
// Dart code example
```

```bash
# Shell commands
```
````

### File Structure Diagrams
Use ASCII art for clarity:
```
src/
├─ navigation/
│  ├─ nav_destination.dart
│  └─ scaffold_with_modal_drawer.dart
└─ screens/
   └─ customers_screen.dart
```

### Emoji Usage
- Use ✅ for completed items
- Use 🖤 in the footer
- Avoid excessive emoji elsewhere

---

## Quality Checklist

Before finalizing a journal entry, ensure:

- [ ] All commits since last journal entry are documented
- [ ] Each commit has a clear description and is linked with hash
- [ ] Commits are organized into logical categories
- [ ] Technical implementation is explained clearly
- [ ] Architecture decisions include reasoning (the "why")
- [ ] Code structure is shown where relevant
- [ ] Both technical and non-technical audiences are addressed
- [ ] File naming follows pattern: `YYYY-MM-DD-day-[number]-[topic].md`
- [ ] Links to commits use correct GitHub URL format

---

## Example Workflow

When asked to create a new journal entry:

1. **Read the most recent journal entry** to understand:
   - What day number we're on
   - The date of the last entry
   - The last documented commit

2. **Get commit history since last entry:**
   ```bash
   git log --since="last-entry-date" --oneline --all
   ```

3. **For each commit, examine changes:**
   ```bash
   git show <commit-hash>
   ```

4. **Group commits** by functionality/category

5. **Create the journal entry** following the structure above

6. **Review for completeness** using the quality checklist

---

## Notes for Claude Code

- **Be thorough:** Review every commit, don't skip any
- **Explain reasoning:** Always include the "why" behind decisions
- **Use proper formatting:** Maintain consistency with previous entries
- **Link all commits:** Every commit should be referenced with its hash
- **Consider audience:** Write for both technical and non-technical readers
- **Show code structure:** Use diagrams and examples to clarify architecture
- **Identify patterns:** Recognize and document design patterns and architectural choices
- **Infer intent:** When commit messages are brief, analyze code changes to understand the full scope

---

## File Naming Convention

```
YYYY-MM-DD-day-[number]-[topic-in-kebab-case].md
```

Examples:
- `2025-12-26-day-one-foundations.md`
- `2025-12-27-day-two-navigation.md`
- `2025-12-28-day-three-ui-foundations.md`

---

**Last Updated:** 2025-12-29
