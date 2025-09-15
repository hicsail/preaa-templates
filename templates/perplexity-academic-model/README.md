# Perplexity Academic Model LangFlow Component

**Category**: Research & Analysis  
**Complexity**: Intermediate  
**PREAA Components**: LangFlow, LiteLLM  
**Estimated Setup Time**: 15 minutes

## Overview

This LangFlow component provides direct integration with Perplexity's API, offering advanced web search capabilities with citations, academic source filtering, and specialized search modes. It's designed to enhance research workflows by providing real-time, cited information from the web with academic-grade source filtering.

## Use Case

Academic researchers and students often need to:
- Search for current information with proper citations
- Filter results to academic and peer-reviewed sources only
- Get real-time answers with source verification
- Access information from specific domains or time periods
- Generate research summaries with proper attribution

This component addresses these needs by providing a powerful search interface that can be integrated into LangFlow workflows for literature reviews, fact-checking, current events research, and academic writing assistance.

## Prerequisites

### Required PREAA Services
- [ ] LangFlow (version 1.0.0+)
- [ ] LiteLLM (version 1.0.0+) - for API key management
- [ ] LibreChat (version 0.6.0+) - for chat interface integration

### External Dependencies
- [ ] Perplexity API account and API key
- [ ] Internet access for web search functionality

### System Requirements
- Minimum RAM: 4 GB
- Network: Stable internet connection
- Python 3.8+ with httpx library

## Setup Instructions

### Step 1: Obtain Perplexity API Key
1. Visit [Perplexity API](https://www.perplexity.ai/settings/api)
2. Sign up for an account or log in
3. Generate an API key
4. Note the key for configuration

### Step 2: Install the Component
1. Copy `perplexity-model-langflow-component.py` to your LangFlow custom components directory
2. Restart LangFlow to load the new component
3. Verify the component appears in the LangFlow component library

### Step 3: Configure in LangFlow
1. Open LangFlow at `http://localhost:7860`
2. Create a new workflow or open an existing one
3. Add the "Perplexity Direct API" component
4. Configure the required settings (see Configuration section)

### Step 4: Test the Component
1. Set up a simple test workflow with the component
2. Provide a test query
3. Verify the response includes citations and proper formatting

## Usage Guide

### Basic Usage
1. **Add Component**: Drag the "Perplexity Direct API" component into your workflow
2. **Configure API Key**: Enter your Perplexity API key in the component settings
3. **Set Query**: Connect a text input or provide a direct message
4. **Run Workflow**: Execute the workflow to get a response with citations

### Input Format
The component accepts various input formats:
- **String**: Direct text query
- **Message Object**: LangFlow message format
- **Dictionary**: With 'text' or 'content' fields

Example inputs:
```
"What are the latest developments in quantum computing?"
"Summarize recent research on climate change mitigation"
"Find peer-reviewed papers on machine learning in healthcare"
```

### Output Format
The component returns a structured response including:
- **Main Content**: The AI-generated response
- **Citations**: Formatted as clickable markdown links
- **Metadata**: Search parameters, usage statistics, and source information
- **Related Questions**: Optional follow-up questions (if enabled)

## Configuration

### Required Settings
- **Perplexity API Key**: Your API key from Perplexity
- **Model Name**: Choose from available models (sonar, sonar-pro, sonar-reasoning)

### Search Configuration
- **Search Mode**: 
  - `default`: General web search
  - `academic`: Academic sources only (peer-reviewed papers, scholarly sources)
- **Search Domain Filter**: Comma-separated domains to include/exclude
  - Include: `wikipedia.org, arxiv.org`
  - Exclude: `-reddit.com, -twitter.com`
- **Search Recency Filter**: Time-based filtering
  - Options: hour, day, week, month, year

### Model Parameters
- **Max Tokens**: Maximum response length (default: 1024)
- **Temperature**: Response creativity (0.0-2.0, default: 0.7)
- **Top P**: Nucleus sampling (0.0-1.0, default: 0.9)
- **Top K**: Top-k sampling (0 to disable, default: 0)
- **Presence Penalty**: Penalty for new topics (-2.0 to 2.0, default: 0.0)
- **Frequency Penalty**: Penalty for repetition (-2.0 to 2.0, default: 0.0)

### Output Options
- **Return Citations**: Include source citations (default: true)
- **Format Citations as Links**: Create clickable markdown links (default: true)
- **Return Related Questions**: Include follow-up questions (default: false)
- **Return Images**: Include related images (default: false)

## Advanced Features

### Academic Search Mode
When set to "academic" mode, the component prioritizes:
- Peer-reviewed academic papers
- Scholarly articles and journals
- University and research institution sources
- Government and official research publications

### Domain Filtering
Control which sources are included or excluded:
```
# Include only specific domains
wikipedia.org, arxiv.org, ieee.org

# Exclude specific domains
-reddit.com, -twitter.com, -facebook.com

# Mixed filtering
wikipedia.org, arxiv.org, -social-media.com
```

### Time-based Filtering
Filter results by recency:
- **hour**: Very recent information
- **day**: Last 24 hours
- **week**: Last 7 days
- **month**: Last 30 days
- **year**: Last 12 months

### Citation Formatting
The component automatically formats citations as:
- Clickable markdown links
- Organized source sections
- Academic source indicators
- Domain filtering notes

## Workflow Integration Examples

### Literature Review Assistant
```
Text Input → Perplexity Component (Academic Mode) → Text Output
```
- Set search mode to "academic"
- Configure domain filter for academic sources
- Enable citation formatting

### Current Events Research
```
Text Input → Perplexity Component (Recent Filter) → Text Output
```
- Set recency filter to "week" or "day"
- Use default search mode
- Enable related questions

### Fact-Checking Workflow
```
Text Input → Perplexity Component (Multiple Sources) → Text Output
```
- Use default search mode
- Configure domain filter for reliable sources
- Enable citation formatting

## Troubleshooting

### Common Issues

#### Issue: API Key Invalid
**Cause**: Incorrect or expired API key
**Solution**: 
- Verify the API key is correct
- Check if the key has expired
- Ensure the key has sufficient credits

#### Issue: No Citations Returned
**Cause**: Citations disabled or search mode issues
**Solution**:
- Enable "Return Citations" option
- Check that search mode is appropriate
- Verify the query is searchable

#### Issue: Rate Limiting
**Cause**: Exceeding API rate limits
**Solution**:
- Reduce request frequency
- Check your Perplexity plan limits
- Implement request queuing

#### Issue: Poor Search Results
**Cause**: Inappropriate search configuration
**Solution**:
- Adjust search mode (academic vs default)
- Refine domain filters
- Modify recency filters
- Improve query specificity

### Performance Tips
- Use academic mode for research queries
- Apply domain filters to focus results
- Set appropriate recency filters
- Monitor API usage and costs
- Cache results when possible

## Examples

### Academic Research Query
**Input**: "What are the latest findings in quantum machine learning?"
**Configuration**:
- Search Mode: academic
- Domain Filter: arxiv.org, ieee.org, nature.com
- Recency Filter: month
- Return Citations: true

**Output**: Comprehensive response with academic citations and recent research findings

### Current Events Query
**Input**: "What happened in AI news this week?"
**Configuration**:
- Search Mode: default
- Recency Filter: week
- Domain Filter: techcrunch.com, wired.com, -social-media.com
- Return Related Questions: true

**Output**: Current news summary with reliable sources and follow-up questions

### Technical Documentation Query
**Input**: "How to implement OAuth 2.0 in Python?"
**Configuration**:
- Search Mode: default
- Domain Filter: stackoverflow.com, github.com, docs.python.org
- Return Citations: true
- Format Citations as Links: true

**Output**: Technical guide with code examples and official documentation links

## Related Templates
- [Literature Review Automation](../sample-literature-review/)
- [Research Paper Summarization](../research-paper-summarization/)
- [Academic Fact-Checking](../academic-fact-checking/)

## Version History
- **v1.0.0**: Initial release with basic Perplexity API integration
- **v1.1.0**: Added academic search mode and domain filtering
- **v1.2.0**: Enhanced citation formatting and metadata handling
- **v1.3.0**: Added recency filtering and related questions support

## Support
For issues specific to this component:
1. Check the troubleshooting section above
2. Verify your Perplexity API key and account status
3. Review the component configuration
4. Open an issue in the templates repository

For general PREAA support:
- Check the main PREAA documentation
- Join the community forum
- Contact the PREAA team

## API Reference

### Perplexity API Models
- **sonar**: General purpose model with web search
- **sonar-pro**: Enhanced model with better reasoning
- **sonar-reasoning**: Advanced reasoning capabilities

### Response Format
```json
{
  "choices": [
    {
      "message": {
        "content": "Response text with citations"
      }
    }
  ],
  "citations": [
    {
      "url": "https://example.com",
      "title": "Source Title"
    }
  ],
  "related_questions": ["Question 1", "Question 2"],
  "usage": {
    "prompt_tokens": 100,
    "completion_tokens": 200,
    "total_tokens": 300
  }
}
```

---

**Note**: This component requires an active Perplexity API subscription. Check [Perplexity Pricing](https://www.perplexity.ai/pricing) for current rates and limits.
