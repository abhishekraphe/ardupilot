# Custom Agent Quick Reference

## Using the DO178C Code Reviewer

### Quick Start

**In a Pull Request:**
```
@copilot review this for DO-178C compliance
```

**In GitHub Copilot Chat:**
```
@workspace /review using DO178C standards
```

**Using Copilot CLI:**
```bash
gh copilot review
```

## What Gets Reviewed

✅ Error handling and boundary checks  
✅ Code documentation and comments  
✅ Safety-critical code patterns  
✅ Resource management  
✅ Testing considerations  
✅ Coding standards compliance  

## Common Issues Found

| Issue | DO-178C Requirement | Fix |
|-------|-------------------|-----|
| Missing null checks | Safety | Add pointer validation |
| Inadequate error handling | Robustness | Add error propagation |
| Undocumented functions | Traceability | Add function documentation |
| Magic numbers | Maintainability | Use named constants |
| Resource leaks | Safety | Proper cleanup in all paths |

## Response to Findings

1. **Critical** → Must fix before merge
2. **Warning** → Should fix unless documented why not
3. **Info** → Consider for future improvements

## Agent Configuration

- **File**: `.github/agents/my-agent.agent.md`
- **Activation**: Automatic after merge to default branch
- **Scope**: All pull requests in the repository

## Need Help?

- 📖 Full guide: `docs/custom-agent-usage.md`
- 💬 Discord: [#development channel](https://ardupilot.org/discord)
- 🌐 Forum: [discuss.ardupilot.org](https://discuss.ardupilot.org/c/development-team)
