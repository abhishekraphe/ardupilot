# How to Use Custom Agents for Code Review

This guide explains how to use custom agents in the ArduPilot repository for automated code reviews.

## Overview

Custom agents are specialized AI assistants that can be invoked through GitHub Copilot to perform specific tasks. The ArduPilot repository includes custom agents configured for code review based on aviation safety standards.

## Available Custom Agents

### DO178C Code Reviewer

The DO178C Code Reviewer agent is configured to review code changes according to DO-178C (Software Considerations in Airborne Systems and Equipment Certification) standards.

**Agent File**: `.github/agents/my-agent.agent.md`

## How to Use the Custom Agent

### Method 1: Using GitHub Copilot CLI

If you have the GitHub Copilot CLI installed, you can test the agent locally:

```bash
# Test the agent on your changes
gh copilot review
```

### Method 2: Through Pull Requests

The custom agent can be invoked automatically in pull requests:

1. **Create a Pull Request**: Push your changes and create a PR as usual
2. **Request Agent Review**: In the PR description or comments, you can request the custom agent to review your changes
3. **Review Feedback**: The agent will analyze your code and provide feedback based on DO-178C standards

### Method 3: Manual Invocation in GitHub Copilot

When using GitHub Copilot in your IDE:

1. Open the file you want reviewed
2. Use the Copilot chat interface
3. Ask specifically for the DO178C review agent:
   ```
   @workspace /review using DO178C standards
   ```

## What the Agent Reviews

The DO178C Code Reviewer checks for:

### 1. Code Structure and Organization
- Proper modularity and separation of concerns
- Clear function and variable naming conventions
- Appropriate code complexity levels

### 2. Error Handling
- Comprehensive error checking
- Proper error propagation
- Graceful degradation strategies
- No silent failures

### 3. Documentation
- Clear and accurate code comments
- Function and module documentation
- Traceability to requirements
- Change history documentation

### 4. Safety Considerations
- Defensive programming practices
- Boundary condition checks
- Resource management
- Null pointer checks
- Array bounds verification

### 5. Testing and Verification
- Code testability
- Test coverage considerations
- Assertions and runtime checks

### 6. Coding Standards
- Adherence to project coding standards
- Consistent formatting
- Proper use of language features
- Avoidance of undefined behavior

## Best Practices

### Before Requesting a Review

1. **Run Local Tests**: Ensure your code compiles and passes basic tests
2. **Follow Coding Standards**: Review the ArduPilot coding standards first
3. **Add Documentation**: Document your changes before requesting review
4. **Keep Changes Focused**: Smaller, focused changes get better reviews

### Interpreting Agent Feedback

- **Critical Issues**: Address these before merging
- **Warnings**: Consider these seriously, especially for flight-critical code
- **Suggestions**: Apply judgment based on your specific use case
- **False Positives**: If you believe a finding is incorrect, document why

### After Review

1. **Address Findings**: Fix or document why each finding cannot be addressed
2. **Update Tests**: Add or modify tests based on feedback
3. **Re-review if Needed**: For significant changes, request another review
4. **Document Decisions**: Record any decisions to not follow recommendations

## Customizing the Agent

To modify the DO178C reviewer or add new agents:

1. **Edit the Agent File**: Modify `.github/agents/my-agent.agent.md`
2. **Update Documentation**: Add details about what the agent checks
3. **Test Changes**: Use the Copilot CLI to test locally
4. **Merge to Default Branch**: Agent changes take effect after merging

### Agent Configuration Format

```yaml
---
name: Agent Name
description: Brief description of what the agent does
---

# Agent Title

Detailed description and instructions for the agent...
```

## Adding Additional Custom Agents

To add more custom agents:

1. Create a new file in `.github/agents/` with the `.agent.md` extension
2. Follow the format shown above
3. Provide clear instructions about the agent's purpose
4. Merge the file to the default branch

## Troubleshooting

### Agent Not Available

- **Ensure Merged**: The agent file must be merged to the default branch
- **Check Format**: Verify the YAML frontmatter is correct
- **Wait for Sync**: It may take a few minutes for changes to propagate

### Unexpected Results

- **Review Instructions**: Check the agent's instructions are clear
- **Test Locally**: Use the Copilot CLI to test and debug
- **Provide Context**: Give the agent enough context about your changes

### Agent Not Responding

- **Check Permissions**: Ensure you have access to GitHub Copilot
- **Verify Syntax**: Check for YAML syntax errors in the agent file
- **Review Logs**: Check for any error messages in the PR or IDE

## Examples

### Example 1: Requesting a DO178C Review

```markdown
@copilot Please review this code change for DO-178C compliance.
This change modifies the flight controller's attitude control loop.
```

### Example 2: Focused Review Request

```markdown
@copilot Review the error handling in this function according to DO-178C standards.
Pay special attention to boundary conditions and resource management.
```

### Example 3: Follow-up Review

```markdown
@copilot I've addressed the previous review comments.
Please verify the error handling improvements meet DO-178C requirements.
```

## Additional Resources

- [DO-178C Standard Overview](https://en.wikipedia.org/wiki/DO-178C)
- [GitHub Copilot Custom Agents Documentation](https://gh.io/customagents/config)
- [ArduPilot Contributing Guidelines](.github/CONTRIBUTING.md)
- [ArduPilot Developer Documentation](https://ardupilot.org/dev/)

## Getting Help

If you need help with custom agents:

1. **Discord**: Join the `#development` channel on [ArduPilot Discord](https://ardupilot.org/discord)
2. **Discussion Forum**: Post in the [Development section](https://discuss.ardupilot.org/c/development-team)
3. **GitHub Issues**: For agent-related bugs, open an issue on GitHub

## Contributing

Improvements to custom agents are welcome! Please:

1. Test your changes locally
2. Document what the agent does
3. Submit a pull request with clear description
4. Follow the existing agent format

---

*Last updated: November 2025*
