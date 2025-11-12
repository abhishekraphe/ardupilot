# Custom Agents

This directory contains custom agent configurations for GitHub Copilot.

## What are Custom Agents?

Custom agents are specialized AI assistants that can be invoked through GitHub Copilot to perform specific tasks like code reviews, documentation generation, or other specialized analyses.

## Available Agents

### DO178C Code Reviewer (`my-agent.agent.md`)

A specialized agent for reviewing code changes against DO-178C aviation software safety standards.

**Usage:**
- In PRs: `@copilot review this for DO-178C compliance`
- In IDE: `@workspace /review using DO178C standards`
- CLI: `gh copilot review`

**Documentation:** See [Custom Agent Usage Guide](../../docs/custom-agent-usage.md)

## Creating a New Custom Agent

To create a new custom agent:

1. Create a new `.agent.md` file in this directory
2. Use the following format:

```yaml
---
name: Your Agent Name
description: Brief description of what your agent does
---

# Agent Title

Detailed instructions and guidelines for the agent...
```

3. Commit and merge to the default branch
4. The agent will be available within a few minutes

## Agent File Format

- **Filename**: Must end with `.agent.md`
- **Frontmatter**: YAML format with `name` and `description` fields
- **Body**: Markdown content with instructions for the agent

## Testing

Test your agent locally using the GitHub Copilot CLI:

```bash
gh copilot review
```

## Resources

- [GitHub Copilot Custom Agents Documentation](https://gh.io/customagents/config)
- [Custom Agent Usage Guide](../../docs/custom-agent-usage.md)
- [Quick Reference](../../docs/custom-agent-quick-reference.md)
