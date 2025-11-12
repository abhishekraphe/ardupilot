# Testing the DO178C Custom Agent

This document provides examples of how to test and validate the DO178C Code Reviewer custom agent.

## Prerequisites

Before testing, ensure:
1. The agent file is merged to the default branch
2. You have access to GitHub Copilot
3. You have the GitHub CLI installed (for CLI testing)

## Test Scenarios

### Scenario 1: Testing Error Handling Review

Create a simple test file with intentional issues:

```cpp
// test_error_handling.cpp
int divide(int a, int b) {
    // Missing: null/zero check for b
    return a / b;
}

void process_data(int* data) {
    // Missing: null pointer check
    int value = *data;
    // Missing: error handling
}
```

**Request Review:**
```
@copilot Review this code for DO-178C compliance, specifically error handling
```

**Expected Findings:**
- Missing division by zero check
- Missing null pointer validation
- Lack of error propagation mechanism

### Scenario 2: Testing Documentation Review

```cpp
// test_documentation.cpp
void updateFlightMode(int mode) {
    // Changes the flight mode
    current_mode = mode;
}
```

**Request Review:**
```
@copilot Check this function documentation against DO-178C requirements
```

**Expected Findings:**
- Missing function description
- No parameter documentation
- No return value documentation
- Missing traceability information

### Scenario 3: Testing Safety-Critical Code

```cpp
// test_safety.cpp
#define MAX_ALTITUDE 1000

void set_altitude(int alt) {
    altitude = alt;  // No bounds checking!
}

float calculate_speed() {
    return distance / time;  // Possible divide by zero
}
```

**Request Review:**
```
@copilot Review this safety-critical code for DO-178C compliance
```

**Expected Findings:**
- Missing boundary validation
- Potential divide by zero
- No defensive programming
- Missing magic number documentation

### Scenario 4: Testing Resource Management

```cpp
// test_resources.cpp
void allocate_buffer() {
    char* buffer = new char[1024];
    // Process buffer
    // Missing: delete[] buffer
}

void open_file() {
    FILE* f = fopen("data.txt", "r");
    // Process file
    // Missing: fclose(f)
}
```

**Request Review:**
```
@copilot Review resource management in this code per DO-178C standards
```

**Expected Findings:**
- Memory leak (missing delete)
- File handle leak (missing fclose)
- No error handling for allocation failures

## Testing Methods

### Method 1: In Pull Request

1. Create a branch with test code
2. Open a pull request
3. Add comment: `@copilot review this for DO-178C compliance`
4. Wait for agent response
5. Review findings

### Method 2: In IDE (VS Code)

1. Open the test file
2. Open Copilot Chat panel
3. Type: `@workspace /review using DO178C standards`
4. Review the inline suggestions

### Method 3: Using GitHub CLI

```bash
# From repository root
gh copilot review

# Or specify a file
gh copilot review path/to/test_file.cpp
```

## Validation Checklist

After running tests, verify the agent:

- [ ] Identifies missing error handling
- [ ] Flags inadequate documentation
- [ ] Catches boundary condition issues
- [ ] Detects resource management problems
- [ ] Notes missing safety checks
- [ ] Provides actionable feedback
- [ ] References DO-178C requirements when relevant

## Common Issues During Testing

### Agent Not Responding

**Check:**
1. Is the agent file merged to default branch?
2. Is the YAML frontmatter correct?
3. Do you have Copilot access?

**Solution:** Wait a few minutes after merge, verify file format

### Unexpected Results

**Check:**
1. Is the test code clear enough?
2. Is the request specific?
3. Is there enough context?

**Solution:** Provide more context in your review request

### Agent Misses Issues

**Note:** AI agents are not perfect. They may:
- Miss some issues (false negatives)
- Flag non-issues (false positives)

Always combine agent reviews with human code review.

## Example Review Request Templates

### General Review
```
@copilot Please review this code for DO-178C compliance.
This code implements [brief description].
```

### Focused Review
```
@copilot Review the error handling in this function according to DO-178C.
Pay attention to boundary conditions and resource management.
```

### Follow-up Review
```
@copilot I've addressed the previous comments. Please verify the changes
meet DO-178C requirements for [specific area].
```

## Measuring Agent Effectiveness

Track these metrics over time:
1. Number of issues caught before human review
2. False positive rate
3. Time saved in code review
4. Code quality improvements

## Feedback and Improvements

If you find issues with the agent:
1. Document the specific case
2. Note what was expected vs. actual result
3. Suggest improvements to the agent configuration
4. Submit a PR with updated agent instructions

## Next Steps

After validating the agent works correctly:
1. Announce availability to the team
2. Create training materials
3. Integrate into CI/CD if possible
4. Gather feedback from users
5. Iterate and improve

---

*For full documentation, see [Custom Agent Usage Guide](custom-agent-usage.md)*
