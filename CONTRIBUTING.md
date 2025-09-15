# Contributing to PREAA Templates

Thank you for your interest in contributing to the PREAA Templates repository! This guide will help you understand how to contribute effectively.

## 🎯 How to Contribute

### 1. Submit New Templates
Share your successful AI workflows that solve academic challenges.

### 2. Improve Existing Templates
Enhance documentation, fix bugs, or add new features to existing templates.

### 3. Report Issues
Help us identify problems or suggest improvements.

### 4. Share Use Cases
Suggest new template categories or requirements based on your experience.

## 📋 Before You Start

### Prerequisites
- A working PREAA environment
- Basic understanding of the PREAA platform components
- Git and GitHub account
- Text editor or IDE

### Check Existing Work
- Browse existing templates to avoid duplicates
- Check open issues and pull requests
- Review the template categories to understand the scope

## 🏗️ Template Structure

Each template must follow this structure:

```
templates/your-template-name/
├── README.md                   # Required: Comprehensive documentation
├── artifacts/                  # Optional: Template artifacts
│   ├── langflow-template.json  # LangFlow workflow exports
│   ├── config.yaml            # Configuration files
│   ├── code/                  # Code snippets and scripts
│   └── examples/              # Example data and demos
└── examples/                  # Optional: Usage examples
    ├── sample-input.json
    └── sample-output.json
```

## 📝 Template Documentation Requirements

Your template's README.md must include:

### Required Sections
1. **Template Overview**
   - Clear description of what the template does
   - Target academic use case
   - Benefits and value proposition

2. **Prerequisites**
   - Required PREAA services
   - External dependencies
   - System requirements

3. **Setup Instructions**
   - Step-by-step installation guide
   - Configuration requirements
   - Credential setup

4. **Usage Guide**
   - How to use the template
   - Input/output specifications
   - Example workflows

5. **Troubleshooting**
   - Common issues and solutions
   - Error messages and fixes
   - Performance considerations

6. **Customization**
   - How to modify the template
   - Configuration options
   - Extension possibilities

### Optional Sections
- **Screenshots**: Visual guides for complex workflows
- **Video Tutorials**: Links to demonstration videos
- **Related Templates**: References to complementary templates
- **Version History**: Changelog and updates

## 🔧 Technical Standards

### Code Quality
- **Tested**: All templates must be tested in a working PREAA environment
- **Documented**: Clear, comprehensive documentation
- **Secure**: No hardcoded credentials or sensitive information
- **Maintainable**: Clean, readable code and configuration

### File Naming
- Use kebab-case for folder and file names
- Be descriptive but concise
- Avoid special characters and spaces

### Documentation Format
- Use Markdown format
- Include clear headings and structure
- Add code blocks with syntax highlighting
- Use emojis sparingly and consistently

## 🚀 Contribution Process

### 1. Fork and Clone
```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/your-username/preaa-templates.git
cd preaa-templates
```

### 2. Create a Branch
```bash
# Create a new branch for your template
git checkout -b feature/your-template-name
```

### 3. Develop Your Template
- Create the template folder structure
- Write comprehensive documentation
- Test thoroughly in your PREAA environment
- Add any necessary artifacts

### 4. Test Your Template
- Verify all instructions work as written
- Test with different configurations
- Check for common issues
- Ensure documentation is clear and complete

### 5. Commit and Push
```bash
# Add your changes
git add templates/your-template-name/

# Commit with a descriptive message
git commit -m "Add template: Brief description of your template"

# Push to your fork
git push origin feature/your-template-name
```

### 6. Submit a Pull Request
- Go to your fork on GitHub
- Click "New Pull Request"
- Fill out the PR template
- Request review from maintainers

## 📋 Pull Request Guidelines

### PR Title Format
```
Add template: [Template Name] - [Brief Description]
```

### PR Description Template
```markdown
## Template Description
Brief description of what this template does and its use case.

## Category
- [ ] Research & Analysis
- [ ] Teaching & Learning
- [ ] Administrative
- [ ] Collaboration

## PREAA Components Used
- [ ] LibreChat
- [ ] LangFlow
- [ ] LiteLLM
- [ ] LangFuse
- [ ] Custom Components

## Testing
- [ ] Tested in local PREAA environment
- [ ] Documentation reviewed for clarity
- [ ] All instructions verified
- [ ] No sensitive information included

## Additional Notes
Any additional information about the template or implementation.
```

## 🔍 Review Process

### What We Look For
- **Functionality**: Does the template work as described?
- **Documentation**: Is it clear and comprehensive?
- **Security**: No hardcoded credentials or sensitive data
- **Reusability**: Can others easily adapt it?
- **Quality**: Follows best practices and standards

### Common Issues
- Missing or unclear documentation
- Hardcoded credentials or sensitive information
- Untested functionality
- Poor file organization
- Incomplete setup instructions

## 🏷️ Template Categories

When submitting a template, choose the most appropriate category:

### Research & Analysis
- Literature review automation
- Data analysis workflows
- Research paper processing
- Citation management

### Teaching & Learning
- Assignment assistance
- Student support systems
- Content generation
- Assessment tools

### Administrative
- Document processing
- Meeting management
- Email automation
- Report generation

### Collaboration
- Peer review systems
- Knowledge sharing
- Team coordination
- Project management

## 🆘 Getting Help

### Questions About Contributing
- Open an issue with the "question" label
- Join our community discussions
- Check existing issues and discussions

### Technical Support
- Review the main PREAA documentation
- Check template-specific troubleshooting guides
- Open an issue with detailed error information

## 📄 Code of Conduct

### Our Standards
- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Maintain a welcoming environment

### Unacceptable Behavior
- Harassment or discrimination
- Spam or off-topic content
- Sharing sensitive information
- Disruptive behavior

## 🎉 Recognition

Contributors will be recognized in:
- The contributors section of the README
- Release notes for significant contributions
- Community highlights and showcases

## 📝 License

By contributing to this repository, you agree that your contributions will be licensed under the same terms as the main PREAA project.

---

Thank you for contributing to PREAA Templates! Your efforts help make AI more accessible to academic institutions worldwide.
