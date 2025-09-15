# Template Deployment Guide

This guide explains how to deploy and use templates from the PREAA Templates repository in your PREAA environment.

## 🎯 Prerequisites

### PREAA Environment
- PREAA platform running locally or in production
- All required services (LibreChat, LangFlow, LiteLLM, LangFuse) operational
- Administrative access to configure services
- Sufficient system resources for the template

### Template Requirements
- Read the template's README thoroughly
- Understand the prerequisites and dependencies
- Gather required credentials and API keys
- Ensure system meets requirements

## 🚀 Deployment Process

### 1. Template Selection
1. Browse the `templates/` directory
2. Read the template's README
3. Verify compatibility with your PREAA version
4. Check system requirements
5. Download or clone the template

### 2. Environment Preparation
1. **Stop PREAA services** (if running):
   ```bash
   cd deploy/local
   docker-compose down
   ```

2. **Backup current configuration**:
   ```bash
   cp -r config config.backup
   ```

3. **Update environment variables** (if needed):
   - Add new credentials to relevant `.env` files
   - Update service configurations
   - Verify database connections

### 3. Template Installation

#### For LangFlow Templates
1. **Import the workflow**:
   - Access LangFlow at `http://localhost:7860`
   - Navigate to the workflows section
   - Click "Import" and select the `langflow-template.json` file
   - Configure any required settings

2. **Set up custom components** (if applicable):
   - Copy custom component files to the appropriate directory
   - Restart LangFlow container
   - Verify components are available

#### For LiteLLM Templates
1. **Configure custom providers**:
   - Copy provider files to the LiteLLM directory
   - Update LiteLLM configuration
   - Restart LiteLLM container

2. **Set up API endpoints**:
   - Configure routing rules
   - Set up authentication
   - Test endpoint connectivity

#### For LibreChat Templates
1. **Configure chat interfaces**:
   - Update LibreChat configuration
   - Set up custom endpoints
   - Configure authentication

2. **Import conversation templates**:
   - Use provided conversation templates
   - Configure system prompts
   - Set up user roles

#### For Custom API Templates
1. **Deploy custom services**:
   - Build and deploy Docker containers
   - Configure service discovery
   - Set up load balancing

2. **Configure service integration**:
   - Update API endpoints
   - Set up authentication
   - Configure error handling

### 4. Configuration

#### Environment Variables
Update the relevant `.env` files with template-specific settings:

```bash
# Example: Adding template-specific variables
# config/.env.litellm
TEMPLATE_API_KEY=your_template_api_key
TEMPLATE_BASE_URL=https://api.template.com
TEMPLATE_TIMEOUT=30

# config/.env.langflow
TEMPLATE_WORKFLOW_ID=your_workflow_id
TEMPLATE_DEBUG_MODE=false
```

#### Service Configuration
Update service-specific configuration files:

```yaml
# Example: LiteLLM configuration
model_list:
  - model_name: template-model
    litellm_params:
      model: template/provider
      api_key: ${TEMPLATE_API_KEY}
      api_base: ${TEMPLATE_BASE_URL}
```

### 5. Testing

#### Basic Functionality Test
1. **Start PREAA services**:
   ```bash
   docker-compose up -d
   ```

2. **Verify service health**:
   - Check LibreChat: `http://localhost:3080`
   - Check LangFlow: `http://localhost:7860`
   - Check LiteLLM: `http://localhost:4000`
   - Check LangFuse: `http://localhost:3000`

3. **Test template functionality**:
   - Use provided sample data
   - Verify expected outputs
   - Check error handling
   - Monitor logs for issues

#### Integration Testing
1. **Test with real data**:
   - Use your own data (if appropriate)
   - Verify performance
   - Check resource usage

2. **Test error scenarios**:
   - Invalid inputs
   - Network failures
   - Service unavailability
   - Authentication failures

### 6. Production Deployment

#### Security Considerations
1. **Review security settings**:
   - Verify authentication is properly configured
   - Check API key management
   - Review network access controls
   - Validate input sanitization

2. **Update firewall rules**:
   - Open required ports
   - Restrict access to necessary services
   - Configure SSL/TLS certificates

#### Performance Optimization
1. **Resource allocation**:
   - Adjust memory limits
   - Configure CPU limits
   - Set up monitoring

2. **Caching configuration**:
   - Enable Redis caching
   - Configure cache policies
   - Monitor cache performance

#### Monitoring Setup
1. **Configure logging**:
   - Set up centralized logging
   - Configure log levels
   - Set up log rotation

2. **Set up monitoring**:
   - Configure Prometheus metrics
   - Set up Grafana dashboards
   - Configure alerting rules

## 🔧 Template-Specific Deployment

### LangFlow Workflows
```bash
# 1. Access LangFlow
open http://localhost:7860

# 2. Import workflow
# - Click "Import" button
# - Select langflow-template.json
# - Configure settings

# 3. Test workflow
# - Use sample data
# - Verify outputs
# - Check error handling
```

### LiteLLM Custom Providers
```bash
# 1. Copy provider files
cp artifacts/litellm/* packages/litellm/

# 2. Update configuration
# Edit packages/litellm/config.yaml

# 3. Restart LiteLLM
docker-compose restart litellm

# 4. Test provider
curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $LITELLM_MASTER_KEY" \
  -d '{"model": "template-model", "messages": [{"role": "user", "content": "test"}]}'
```

### Custom API Services
```bash
# 1. Build custom service
cd artifacts/custom-service
docker build -t template-service .

# 2. Update docker-compose.yml
# Add service definition

# 3. Start service
docker-compose up -d template-service

# 4. Test service
curl http://localhost:8080/health
```

## 🐛 Troubleshooting

### Common Issues

#### Service Won't Start
**Symptoms**: Container fails to start or crashes immediately
**Solutions**:
- Check logs: `docker-compose logs service-name`
- Verify environment variables
- Check port conflicts
- Verify resource availability

#### Template Not Working
**Symptoms**: Template imports but doesn't function correctly
**Solutions**:
- Check template configuration
- Verify API keys and credentials
- Check service connectivity
- Review template documentation

#### Performance Issues
**Symptoms**: Slow response times or high resource usage
**Solutions**:
- Check resource allocation
- Optimize configuration
- Enable caching
- Scale services if needed

#### Authentication Errors
**Symptoms**: 401/403 errors when using template
**Solutions**:
- Verify API keys
- Check authentication configuration
- Review service permissions
- Test with different credentials

### Debugging Steps

1. **Check service logs**:
   ```bash
   docker-compose logs -f service-name
   ```

2. **Verify configuration**:
   ```bash
   # Check environment variables
   docker-compose config

   # Test service connectivity
   curl http://localhost:port/health
   ```

3. **Test with minimal configuration**:
   - Start with basic settings
   - Gradually add complexity
   - Identify the failing component

4. **Check resource usage**:
   ```bash
   docker stats
   ```

## 📊 Monitoring and Maintenance

### Health Checks
Set up regular health checks for:
- Service availability
- API response times
- Error rates
- Resource usage

### Log Monitoring
Monitor logs for:
- Error messages
- Performance issues
- Security events
- Usage patterns

### Regular Maintenance
- Update dependencies
- Review security settings
- Optimize performance
- Clean up old data

## 🔄 Updates and Upgrades

### Template Updates
1. **Check for updates**:
   - Monitor template repository
   - Review changelog
   - Check compatibility

2. **Apply updates**:
   - Backup current configuration
   - Download new version
   - Test in staging environment
   - Deploy to production

### PREAA Platform Updates
1. **Check compatibility**:
   - Review PREAA release notes
   - Test template with new version
   - Update if necessary

2. **Plan upgrade**:
   - Schedule maintenance window
   - Backup all data
   - Test upgrade process
   - Deploy and verify

## 📚 Additional Resources

### PREAA Documentation
- [Main PREAA Repository](https://github.com/your-org/preaa)
- [Deployment Guide](https://github.com/your-org/preaa/blob/main/deploy/README.md)
- [Configuration Reference](https://github.com/your-org/preaa/blob/main/docs/configuration.md)

### Template-Specific Help
- Check template README for specific instructions
- Review template issues and discussions
- Contact template maintainers
- Join community forums

### Support Channels
- GitHub Issues
- Community Forum
- Slack/Discord
- Office Hours

---

Remember: Always test templates in a staging environment before deploying to production, and keep backups of your configuration!
