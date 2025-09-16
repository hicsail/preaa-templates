# Composio Connect LangFlow Component

**Category**: Integration & Automation  
**Complexity**: Advanced  
**PREAA Components**: LangFlow, LiteLLM  
**Estimated Setup Time**: 30 minutes

## Overview

The Composio Connect component provides seamless integration with Composio's marketplace of 200+ tools and services, enabling AI agents to interact with external applications through a unified interface. This component supports authentication, tool selection, and exposes comprehensive tool sets for agent workflows.

## Use Case

Academic institutions and researchers often need to:
- Automate administrative tasks across multiple platforms
- Integrate AI agents with productivity tools (email, calendar, documents)
- Connect research workflows with external data sources
- Streamline communication and collaboration tools
- Automate data collection and analysis from various APIs

This component addresses these needs by providing a single interface to access hundreds of tools including Microsoft 365, Google Workspace, Slack, GitHub, Notion, and many more through Composio's unified API.

## Prerequisites

### Required PREAA Services
- [ ] LangFlow (version 1.0.0+)
- [ ] LiteLLM (version 1.0.0+) - for API key management
- [ ] LibreChat (version 0.6.0+) - for chat interface integration

### External Dependencies
- [ ] Composio API account and API key
- [ ] Accounts for the services you want to integrate (e.g., Microsoft 365, Google Workspace)
- [ ] Internet access for API calls

### System Requirements
- Minimum RAM: 8 GB
- Network: Stable internet connection
- Python 3.8+ with composio library

## Setup Instructions

### Step 1: Obtain Composio API Key
1. Visit [Composio Dashboard](https://app.composio.dev/)
2. Sign up for an account or log in
3. Navigate to API Keys section
4. Generate a new API key
5. Note the key for configuration

### Step 2: Install the Component
1. Copy `composio-connect-component.py` to your LangFlow custom components directory
2. Install required dependencies: `pip install composio`
3. Restart LangFlow to load the new component
4. Verify the component appears in the LangFlow component library

### Step 3: Configure Authentication
1. Open LangFlow at `http://localhost:7860`
2. Add the "Composio Connect" component to your workflow
3. Enter your Composio API key
4. Select the tools/services you want to integrate
5. Complete OAuth authentication for each service

### Step 4: Test the Component
1. Set up a simple test workflow with the component
2. Configure a basic action (e.g., send email, create calendar event)
3. Execute the workflow to verify integration

## Usage Guide

### Basic Usage
1. **Add Component**: Drag the "Composio Connect" component into your workflow
2. **Configure API Key**: Enter your Composio API key
3. **Select Tools**: Choose from available integrations
4. **Authenticate**: Complete OAuth flow for selected services
5. **Configure Actions**: Set up specific actions and parameters
6. **Run Workflow**: Execute to perform the configured actions

### Available Integrations
The component supports 200+ integrations including:

#### Productivity & Communication
- **Microsoft 365**: Outlook, Teams, OneDrive, SharePoint
- **Google Workspace**: Gmail, Calendar, Drive, Docs, Sheets
- **Slack**: Messaging, file sharing, workflow automation
- **Discord**: Community management, bot interactions

#### Development & Code
- **GitHub**: Repository management, issues, pull requests
- **GitLab**: CI/CD, project management
- **Jira**: Issue tracking, project management
- **Confluence**: Documentation, knowledge management

#### Data & Analytics
- **Notion**: Database management, documentation
- **Airtable**: Spreadsheet-database hybrid
- **MongoDB**: Database operations
- **PostgreSQL**: Database queries

#### Research & Academic
- **Zotero**: Reference management
- **Mendeley**: Research collaboration
- **ORCID**: Researcher identification
- **ResearchGate**: Academic networking

### Action Configuration
Each integration provides specific actions. For example, with Outlook integration:

#### Email Actions
- **Send Email**: Send messages with attachments
- **List Messages**: Retrieve and filter emails
- **Reply to Email**: Respond to specific messages
- **Create Draft**: Prepare emails for later sending

#### Calendar Actions
- **List Events**: Retrieve calendar events
- **Create Event**: Schedule meetings and appointments
- **Get Event**: Retrieve specific event details

## Configuration

### Required Settings
- **Composio API Key**: Your API key from Composio
- **Selected Tools**: Choose which services to integrate
- **Authentication**: Complete OAuth for each service

### Tool-Specific Configuration
Each tool requires specific configuration:

#### Microsoft 365 (Outlook)
```yaml
authentication:
  type: oauth2
  client_id: your_client_id
  client_secret: your_client_secret
  tenant_id: your_tenant_id

actions:
  - send_email
  - list_messages
  - create_calendar_event
  - reply_to_email
```

#### Google Workspace
```yaml
authentication:
  type: oauth2
  client_id: your_client_id
  client_secret: your_client_secret
  scopes:
    - https://www.googleapis.com/auth/gmail.readonly
    - https://www.googleapis.com/auth/calendar

actions:
  - gmail_send
  - calendar_list_events
  - drive_upload_file
```

### Advanced Configuration
- **Rate Limiting**: Configure API call limits
- **Error Handling**: Set retry policies and fallback actions
- **Data Filtering**: Apply filters to retrieved data
- **Batch Operations**: Process multiple actions efficiently

## Workflow Integration Examples

### Academic Email Automation
```
Text Input → Composio Connect (Outlook) → Email Sent
```
- Automatically send research updates to collaborators
- Schedule follow-up emails for grant applications
- Send meeting reminders and agendas

### Research Data Collection
```
Trigger → Composio Connect (GitHub + Notion) → Data Stored
```
- Collect research data from GitHub repositories
- Store findings in Notion databases
- Generate automated reports

### Calendar Management
```
Text Input → Composio Connect (Google Calendar) → Event Created
```
- Schedule research meetings automatically
- Block time for writing and analysis
- Coordinate with international collaborators

### Document Collaboration
```
File Upload → Composio Connect (Google Drive + Slack) → Team Notified
```
- Share research documents with team
- Notify collaborators of updates
- Maintain version control

## Advanced Features

### Multi-Service Workflows
Combine multiple services in a single workflow:
- **Email + Calendar**: Send meeting invites and schedule events
- **GitHub + Slack**: Notify team of code changes
- **Notion + Google Drive**: Sync documents and databases

### Conditional Logic
Implement smart automation:
- **If-then-else**: Different actions based on conditions
- **Loops**: Process multiple items automatically
- **Error handling**: Fallback actions for failed operations

### Data Transformation
Process data between services:
- **Format conversion**: Convert between different data formats
- **Data enrichment**: Add metadata and context
- **Filtering**: Extract relevant information only

## Troubleshooting

### Common Issues

#### Issue: Authentication Failed
**Cause**: Invalid credentials or expired tokens
**Solution**: 
- Verify API keys are correct
- Re-authenticate OAuth connections
- Check service-specific permissions

#### Issue: Action Execution Failed
**Cause**: Invalid parameters or service unavailable
**Solution**:
- Verify action parameters
- Check service status
- Review error logs for specific issues

#### Issue: Rate Limiting
**Cause**: Exceeding API rate limits
**Solution**:
- Implement request queuing
- Add delays between requests
- Use batch operations when possible

#### Issue: Permission Denied
**Cause**: Insufficient permissions for the action
**Solution**:
- Review OAuth scopes
- Update service permissions
- Use appropriate user accounts

### Performance Tips
- Use batch operations for multiple actions
- Implement caching for frequently accessed data
- Monitor API usage and costs
- Optimize data filtering to reduce payload sizes

## Examples

### Research Collaboration Workflow
**Input**: "Schedule a meeting with Dr. Smith about the quantum computing project"
**Configuration**:
- Tool: Microsoft 365 (Outlook + Calendar)
- Actions: Create calendar event, send email invitation
- Parameters: Meeting time, attendees, agenda

**Output**: Meeting scheduled and invitations sent

### Literature Review Automation
**Input**: "Find recent papers on machine learning and save to Zotero"
**Configuration**:
- Tool: Zotero + Research APIs
- Actions: Search papers, add to library, create collections
- Parameters: Search terms, date range, collection name

**Output**: Papers added to Zotero library with proper citations

### Grant Application Tracking
**Input**: "Update grant application status and notify team"
**Configuration**:
- Tool: Notion + Slack + Email
- Actions: Update database, send notifications
- Parameters: Grant ID, new status, team members

**Output**: Database updated and team notified

## Related Templates
- [Perplexity Academic Model](../perplexity-academic-model/)
- [Literature Review Automation](../sample-literature-review/)
- [Research Workflow Automation](../research-workflow-automation/)

## Version History
- **v1.0.0**: Initial release with basic Composio integration
- **v1.1.0**: Added support for 200+ tools and services
- **v1.2.0**: Enhanced authentication and error handling
- **v1.3.0**: Added batch operations and advanced filtering

## Support
For issues specific to this component:
1. Check the troubleshooting section above
2. Verify your Composio API key and service permissions
3. Review the component configuration
4. Check Composio documentation for service-specific issues
5. Open an issue in the templates repository

For general PREAA support:
- Check the main PREAA documentation
- Join the community forum
- Contact the PREAA team

## API Reference

### Composio Integration
- **API Documentation**: [Composio Docs](https://docs.composio.dev/)
- **Available Tools**: [Composio Marketplace](https://app.composio.dev/tools)
- **Authentication**: OAuth 2.0 for most services

### Supported Actions
Each tool provides specific actions. Common patterns include:
- **CRUD Operations**: Create, read, update, delete
- **Search & Filter**: Find specific items
- **Send & Receive**: Communication actions
- **Schedule & Manage**: Time-based operations

### Response Format
```json
{
  "successful": true,
  "data": {
    "response_data": {...},
    "status_code": 200
  },
  "error": null
}
```

---

**Note**: This component requires active subscriptions for the services you want to integrate. Check individual service pricing and Composio's pricing at [Composio Pricing](https://composio.dev/pricing).
