# PREAA Templates Repository

A curated collection of AI workflow templates designed to solve common academic use cases using the PREAA (Providing Reusable Equitable AI Access in Academia) platform.

## 🎯 Purpose

This repository serves as a community-driven collection of pre-built AI workflows and templates that address real-world academic challenges. Each template provides a complete, documented solution that can be easily deployed and customized within the PREAA ecosystem.

## 🏗️ Repository Structure

```
preaa-templates/
├── README.md                           # This file
├── CONTRIBUTING.md                     # Contribution guidelines
├── templates/                          # Main templates directory
│   ├── template-name/                  # Individual template folder
│   │   ├── README.md                   # Template documentation
│   │   ├── artifacts/                  # Template artifacts (JSON, configs, etc.)
│   │   │   ├── langflow-template.json  # LangFlow workflow export
│   │   │   ├── config.yaml            # Configuration files
│   │   │   └── ...                     # Other relevant artifacts
│   │   └── examples/                   # Usage examples and demos
│   └── ...
└── docs/                              # Additional documentation
    ├── template-creation-guide.md     # How to create new templates
    └── deployment-guide.md            # Template deployment instructions
```

## 📋 Template Requirements

Each template must include:

### Required Files
- **`README.md`**: Comprehensive documentation including:
  - Template description and use case
  - Required tools and services
  - Credentials and configuration needed
  - Input/output specifications
  - Step-by-step setup instructions
  - Usage examples
  - Troubleshooting guide

### Optional Artifacts
- **LangFlow JSON exports**: For workflow-based templates
- **Configuration files**: YAML, JSON, or environment files
- **Code snippets**: Python, JavaScript, or other relevant code
- **Screenshots**: Visual guides for complex workflows
- **Example data**: Sample inputs for testing

## 🚀 Getting Started

### Browsing Templates
1. Navigate to the `templates/` directory
2. Each template folder contains a detailed README
3. Review the template documentation before implementation
4. Check the `artifacts/` folder for downloadable components

### Using a Template
1. Read the template's README thoroughly
2. Ensure you have the required PREAA services running
3. Follow the setup instructions
4. Import any provided artifacts (LangFlow JSON, configs, etc.)
5. Configure credentials and test the workflow

### Creating a New Template
1. Fork this repository
2. Create a new folder in `templates/` with a descriptive name
3. Follow the [Template Creation Guide](docs/template-creation-guide.md)
4. Submit a pull request with your template

## 🛠️ Template Categories

Templates are organized by academic use case:

### Research & Analysis
- Literature review automation
- Data analysis workflows
- Research paper summarization
- Citation management

### Teaching & Learning
- Assignment grading assistance
- Student Q&A systems
- Content generation tools
- Learning assessment workflows

### Administrative
- Document processing
- Meeting summarization
- Email automation
- Report generation

### Collaboration
- Peer review systems
- Knowledge sharing platforms
- Team coordination tools
- Project management workflows

## 🔧 Technical Requirements

### PREAA Platform Components
Templates may utilize any combination of:
- **LibreChat**: Chat interfaces and conversation management
- **LangFlow**: Visual workflow builder
- **LiteLLM**: LLM proxy and management
- **LangFuse**: Analytics and monitoring
- **Custom Components**: Specialized integrations

### Supported Formats
- **LangFlow**: JSON workflow exports
- **LiteLLM**: Custom provider configurations
- **Docker**: Containerized solutions
- **API**: RESTful service integrations
- **Webhooks**: Event-driven workflows

## 🤝 Contributing

We welcome contributions from the academic community! Here's how you can help:

### Ways to Contribute
1. **Submit New Templates**: Share your successful AI workflows
2. **Improve Existing Templates**: Enhance documentation or functionality
3. **Report Issues**: Help us identify problems or improvements
4. **Share Use Cases**: Suggest new template categories or requirements

### Contribution Process
1. Read our [Contributing Guidelines](CONTRIBUTING.md)
2. Check existing templates to avoid duplicates
3. Follow the template structure and documentation standards
4. Test your template thoroughly
5. Submit a pull request with clear descriptions

### Quality Standards
- **Documentation**: Clear, comprehensive, and well-formatted
- **Functionality**: Tested and verified to work
- **Accessibility**: Easy to understand and implement
- **Reusability**: Adaptable to different academic contexts

## 📚 Documentation

- [Template Creation Guide](docs/template-creation-guide.md): Step-by-step instructions for creating new templates
- [Deployment Guide](docs/deployment-guide.md): How to deploy templates in your PREAA environment
- [Contributing Guidelines](CONTRIBUTING.md): Detailed contribution process and standards

## 🔍 Finding Templates

### By Category
Browse the `templates/` directory and look for category-specific folders or tags in README files.

### By Technology
- **LangFlow Templates**: Look for `langflow-template.json` files
- **API Integrations**: Check for configuration files and code examples
- **Docker Solutions**: Look for `docker-compose.yml` or Dockerfile artifacts

### By Complexity
- **Beginner**: Simple, single-service templates
- **Intermediate**: Multi-service integrations
- **Advanced**: Complex workflows with custom components

## 🆘 Support

### Getting Help
1. Check the template's README for troubleshooting
2. Review the [PREAA main repository](https://github.com/your-org/preaa) documentation
3. Open an issue in this repository
4. Join our community discussions

### Reporting Issues
When reporting issues with templates:
1. Specify the template name and version
2. Describe your environment (PREAA version, services running)
3. Include error messages and logs
4. Provide steps to reproduce the issue

## 📄 License

This repository is licensed under the same terms as the main PREAA project. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Thank you to all contributors who share their AI workflows and help make PREAA more accessible to academic institutions worldwide.

---

**PREAA Templates** - Empowering academic institutions with proven AI solutions and workflows.

For more information about the PREAA platform, visit the [main PREAA repository](https://github.com/your-org/preaa).
