# Template Creation Guide

This guide will walk you through creating a new template for the PREAA Templates repository.

## 🎯 Planning Your Template

### 1. Identify the Use Case
- What academic problem does your template solve?
- Who is the target audience (researchers, students, administrators)?
- What is the expected outcome or benefit?

### 2. Choose the Right Technology
- **LangFlow**: For visual workflow-based solutions
- **LiteLLM**: For LLM proxy and management tasks
- **LibreChat**: For chat-based interfaces
- **Custom APIs**: For specialized integrations
- **Docker**: For containerized solutions

### 3. Define the Scope
- What PREAA components will be used?
- What external services or APIs are required?
- What credentials or configuration is needed?
- What are the input and output specifications?

## 🏗️ Template Structure

Create your template folder with this structure:

```
templates/your-template-name/
├── README.md                   # Required: Main documentation
├── artifacts/                  # Optional: Template files
│   ├── langflow-template.json  # LangFlow workflow export
│   ├── config.yaml            # Configuration files
│   ├── code/                  # Code snippets and scripts
│   │   ├── main.py
│   │   └── requirements.txt
│   └── examples/              # Example data
│       ├── sample-input.json
│       └── sample-output.json
└── examples/                  # Optional: Usage examples
    ├── demo-script.py
    └── test-data.csv
```

## 📝 Writing the README

Your template's README.md should follow this structure:

### 1. Template Header
```markdown
# Template Name

**Category**: [Research & Analysis | Teaching & Learning | Administrative | Collaboration]  
**Complexity**: [Beginner | Intermediate | Advanced]  
**PREAA Components**: [LibreChat, LangFlow, LiteLLM, LangFuse, Custom Components]  
**Estimated Setup Time**: [X minutes/hours]

## Overview
Brief description of what this template does and its academic use case.

## Use Case
Detailed explanation of the problem it solves and who would benefit from it.
```

### 2. Prerequisites Section
```markdown
## Prerequisites

### Required PREAA Services
- [ ] LibreChat (version X.X+)
- [ ] LangFlow (version X.X+)
- [ ] LiteLLM (version X.X+)
- [ ] LangFuse (version X.X+)

### External Dependencies
- [ ] External API access (if applicable)
- [ ] Database access (if applicable)
- [ ] File storage (if applicable)

### System Requirements
- Minimum RAM: X GB
- Storage: X GB
- Network: Internet access for external APIs
```

### 3. Setup Instructions
```markdown
## Setup Instructions

### Step 1: Prepare Your Environment
1. Ensure PREAA services are running
2. Verify required credentials are available
3. Check system requirements

### Step 2: Configure Services
1. Update configuration files
2. Set up API keys and credentials
3. Test service connectivity

### Step 3: Import Template
1. Download template artifacts
2. Import into appropriate PREAA component
3. Configure template-specific settings

### Step 4: Test the Template
1. Run with sample data
2. Verify expected outputs
3. Check error handling
```

### 4. Usage Guide
```markdown
## Usage Guide

### Input Format
Describe the expected input format, including:
- Data structure
- Required fields
- Optional parameters
- Example input

### Output Format
Describe the expected output format, including:
- Data structure
- Available fields
- Error conditions
- Example output

### Workflow Steps
1. Step 1: Description
2. Step 2: Description
3. Step 3: Description
```

### 5. Configuration Options
```markdown
## Configuration

### Environment Variables
```bash
# Required
API_KEY=your_api_key_here
DATABASE_URL=postgresql://...

# Optional
DEBUG_MODE=false
LOG_LEVEL=info
```

### Template Settings
- **Setting 1**: Description and default value
- **Setting 2**: Description and default value
- **Setting 3**: Description and default value
```

### 6. Troubleshooting
```markdown
## Troubleshooting

### Common Issues

#### Issue: Error message
**Cause**: Brief explanation of what causes this error
**Solution**: Step-by-step solution

#### Issue: Another error message
**Cause**: Brief explanation
**Solution**: Step-by-step solution

### Performance Tips
- Tip 1: Description
- Tip 2: Description
- Tip 3: Description
```

## 🔧 Creating Artifacts

### LangFlow Templates
1. Design your workflow in LangFlow
2. Test thoroughly with sample data
3. Export as JSON using LangFlow's export feature
4. Save as `artifacts/langflow-template.json`
5. Include import instructions in README

### Configuration Files
Create YAML or JSON configuration files:
```yaml
# config.yaml example
template:
  name: "your-template"
  version: "1.0.0"
  description: "Template description"

settings:
  api_endpoint: "https://api.example.com"
  timeout: 30
  retry_attempts: 3

credentials:
  required:
    - api_key
    - database_url
  optional:
    - debug_token
```

### Code Snippets
Include relevant code files:
```python
# main.py example
import os
import requests
from typing import Dict, Any

class TemplateProcessor:
    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.api_key = os.getenv('API_KEY')
    
    def process(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        # Your processing logic here
        pass
```

## 🧪 Testing Your Template

### 1. Local Testing
- Test in your local PREAA environment
- Use sample data to verify functionality
- Check error handling with invalid inputs
- Verify all documentation steps work

### 2. Documentation Review
- Have someone else follow your instructions
- Check for clarity and completeness
- Verify all links and references work
- Ensure no sensitive information is included

### 3. Quality Checklist
- [ ] Template works as described
- [ ] Documentation is clear and complete
- [ ] No hardcoded credentials
- [ ] Error handling is appropriate
- [ ] Performance is acceptable
- [ ] Code follows best practices

## 📊 Template Categories

### Research & Analysis
Focus on:
- Data processing and analysis
- Literature review automation
- Research paper processing
- Citation management
- Statistical analysis

### Teaching & Learning
Focus on:
- Student assistance tools
- Assignment grading
- Content generation
- Learning assessment
- Educational content creation

### Administrative
Focus on:
- Document processing
- Meeting management
- Email automation
- Report generation
- Data entry automation

### Collaboration
Focus on:
- Peer review systems
- Knowledge sharing
- Team coordination
- Project management
- Communication tools

## 🎨 Best Practices

### Documentation
- Use clear, concise language
- Include plenty of examples
- Add screenshots for complex workflows
- Provide troubleshooting guidance
- Keep it up-to-date

### Code Quality
- Follow language-specific conventions
- Add comments and docstrings
- Handle errors gracefully
- Use environment variables for configuration
- Include logging where appropriate

### Security
- Never include hardcoded credentials
- Use environment variables for sensitive data
- Validate all inputs
- Follow security best practices
- Document security considerations

### Performance
- Optimize for common use cases
- Include performance considerations in documentation
- Test with realistic data volumes
- Provide scaling guidance
- Monitor resource usage

## 🚀 Publishing Your Template

### 1. Final Review
- Test everything one more time
- Review documentation for clarity
- Check for any sensitive information
- Verify all artifacts are included

### 2. Create Pull Request
- Follow the PR template
- Include clear description
- Reference any related issues
- Request appropriate reviewers

### 3. Respond to Feedback
- Address review comments promptly
- Make requested changes
- Ask questions if unclear
- Thank reviewers for their time

## 📚 Additional Resources

### PREAA Documentation
- [Main PREAA Repository](https://github.com/your-org/preaa)
- [LibreChat Documentation](https://docs.librechat.ai/)
- [LangFlow Documentation](https://docs.langflow.org/)
- [LiteLLM Documentation](https://docs.litellm.ai/)
- [LangFuse Documentation](https://langfuse.com/docs)

### Community Resources
- PREAA Community Forum
- Template Discussion Channel
- Office Hours (if available)
- Contributor Slack/Discord

---

Remember: The goal is to create templates that are useful, well-documented, and easy for others to implement. Take your time to get it right, and don't hesitate to ask for help!
