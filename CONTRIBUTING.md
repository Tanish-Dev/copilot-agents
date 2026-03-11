# Contributing to Awesome Dev Agents

Thanks for wanting to contribute! This project grows through community-added agents. Here's everything you need to know.

---

## What Makes a Good Agent

A great agent submission:

1. **Has a clear, focused domain** — "Frontend Dev" is better than "Programming Helper"
2. **Includes opinionated rules** — Tell the agent HOW to work, not just what it is
3. **Specifies the right tools** — Only include tools the agent actually needs
4. **Has example trigger phrases** — So users know when to invoke it
5. **Works without modification** — Users should be able to copy-paste and go

---

## File Structure

Every agent file **must** follow this exact format:

```markdown
---
name: Your Agent Name
description: |
  One to three sentences on what this agent does.
  Include trigger keywords (words users would say to invoke it).
  Be specific about the domain and stack.
tools: ['read', 'edit', 'search', 'create', 'run_command']
model: claude-sonnet-4-5   # optional — omit to use default
---

## Role

One paragraph describing the agent's identity and expertise.

## Stack

List the technologies, languages, and frameworks this agent knows.

## Rules

- Rule 1: Specific, actionable instruction
- Rule 2: Another specific rule
- Rule 3: Keep rules concrete (not "write good code" but "always add type hints")

## Output Format (if applicable)

Describe the expected output structure if the agent produces reports or documents.
```

---

## Tool Selection Guide

Only include tools the agent actually needs:

| Tool | Include when... |
|------|----------------|
| `read` | Agent reads files (almost always) |
| `edit` | Agent modifies existing files |
| `create` | Agent creates new files |
| `search` | Agent needs to find files or grep for patterns |
| `run_command` | Agent runs terminal commands (builds, tests, linters) |
| `fetch` | Agent needs to read URLs or external documentation |

---

## Submission Steps

1. **Fork** this repository
2. **Create your agent file** in `/agents/your-agent-name.agent.md`
3. **Test it** — actually add it to a project and verify it works as expected
4. **Update README.md** — add a row to the agents table and a section with description + trigger examples
5. **Open a Pull Request** with:
   - A brief description (1–3 sentences) of what the agent does
   - The domain/stack it covers
   - A screenshot or example session if possible

---

## What We Won't Accept

- Agents that duplicate existing ones without meaningful differentiation
- Agents that are just "be helpful with X" without specific rules or output format
- Agents tied to specific personal projects or company codebases
- Agents with no clear use case or example triggers

---

## Questions?

Open an issue and tag it `question`. We're happy to help refine agent ideas before you write the full thing.
