
# 🧩 Notion → Slack Task Summarizer (LangFlow)

**Category**: Collaboration  
**Complexity**: Intermediate  
**PREAA Components**: LangFlow, Custom Components  
**Estimated Setup Time**: ≤ 10 minutes

---

## Overview
This template lets you ask for tasks in **natural language**, converts your request into a **Notion database JSON query**, fetches matching tasks, **summarizes** them, and **posts** the summary to **Slack**.

Typical ask:
> “Show all high-priority tasks due this week assigned to Marcus.”

The flow:
```

Natural Language → LLM → Notion Query (JSON) → Notion DB → LLM Summary → Slack Message

````

## Use Case
- **Problem**: Teams spend time filtering/sorting tasks across tools.
- **Audience**: Students & project teams (e.g., XC475), researchers, admins.
- **Benefit**: Conversational task retrieval + automated Slack summaries.

> ℹ️ This template currently uses a **copy of the XC475 Sprint Dashboard**; permission to integrate with the **official XC475 Notion workspace** is in progress.

---

## Prerequisites

### Required PREAA Services
- [x] LangFlow (v1.1+ recommended)
- [ ] LibreChat (optional)
- [ ] LiteLLM (optional, if proxying LLMs)
- [ ] LangFuse (optional)

### External Dependencies
- [x] **Notion**: Internal Integration + database shared to the integration
- [x] **Slack**: Workspace app with OAuth scopes
- [x] **LLM Provider**: OpenAI by default (swap to another if desired)

### System Requirements
- Minimum RAM: 2–4 GB  
- Storage: 1 GB  
- Network: Internet access for APIs

---

## Setup Instructions

### Step 1: Prepare Your Environment
1. Ensure LangFlow is running (Docker **or** local Python).
2. Collect credentials:
   - `OPENAI_API_KEY` *(or another LLM’s key if you adjust the model component)*
   - `NOTION_SECRET` *(Internal Integration token)*
   - `NOTION_DATABASE_ID` *(Task DB ID)*
   - `SLACK_USER_TOKEN` *(xoxp-…)* and a Slack channel you can post to.
3. Confirm your Notion DB is **shared** with your Notion integration.

> 🔑 **Notion Database ID**: The 32-char ID in your DB URL, e.g.  
> `https://www.notion.so/workspace/Tasks-28452a2c9ba781b395c8e78de0614215`  
> → `NOTION_DATABASE_ID=28452a2c9ba781b395c8e78de0614215`

### Step 2: Configure Services
1. Create a `.env` file (for your convenience):
   ```bash
   OPENAI_API_KEY=sk-...
   NOTION_SECRET=secret_...
   NOTION_DATABASE_ID=28452a2c9ba781b395c8e78de0614215
   SLACK_USER_TOKEN=xoxp-...
   SLACK_DEFAULT_CHANNEL=#general
```

2. **Important:** Even if you use `.env`, you must **also paste these values into the LangFlow UI fields** of each component (LLM, Notion, Slack Sender). LangFlow does **not** auto-inject `.env` into component fields in the UI.

3. (Optional) Update `artifacts/config.yaml` to tweak defaults (model, timeouts, etc.).

### Step 3: Import Template

1. Run LangFlow:

   * **Docker (recommended):**

     ```bash
     docker run -it --rm \
       -p 7860:7860 \
       --env-file .env \
       -v $(pwd)/artifacts:/app/artifacts \
       -v $(pwd)/custom_components:/app/langflow/custom \
       langflowai/langflow:latest
     ```
   * **Local Python:**

     ```bash
     pip install langflow openai requests python-dotenv
     langflow run
     ```
2. Open `http://localhost:7860`
3. Import `artifacts/langflow-template.json`

### Step 4: Test the Template

1. In the input node, try:
   `high priority tasks due this week assigned to Marcus`
2. Verify:

   * A valid Notion query is generated (JSON)
   * Results are fetched and summarized
   * A Slack message appears in your target channel

---

## Usage Guide

### Input Format

* **Natural language instruction** (string)
* Examples:

  * “Show in-progress tasks due this week.”
  * “High priority tasks assigned to Marcus, sort by Due date.”

### Output Format

* Posts a **Markdown summary** to the configured Slack channel.
* Internal debug outputs (optional):

  * Generated Notion JSON query
  * Count of tasks returned

**Example Slack message snippet**

```
### Sprint Status Summary

**Filters**: Priority = High, Status = In Progress  
**Total**: 5 tasks

• Create Database Schema — Assignee: Marcus — Due: 2025-10-10 — Priority: High  
• …
```

### Workflow Steps

1. **LLM** converts NL → valid Notion filter JSON.
2. **Notion Query** executes against your Tasks DB.
3. **Summarizer** formats a short, useful Slack digest.
4. **Slack Sender** posts the Markdown to your channel.

---

## Configuration

### Environment Variables

```bash
# Required
OPENAI_API_KEY=sk_yourkey            # or substitute with another LLM provider + model
NOTION_SECRET=secret_integration_token
NOTION_DATABASE_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SLACK_USER_TOKEN=xoxp_your_user_token

# Optional
SLACK_DEFAULT_CHANNEL=#general
```

### Template Settings (artifacts/config.yaml)

* **llm.provider**: `"openai"` (swap to `"anthropic"`, etc. if you adapt the LLM node)
* **llm.model**: `"gpt-4o"` (change in LangFlow UI)
* **notion.query_mode**: `"dynamic"` (LLM builds filters)
* **slack.post_mode**: `"markdown"`

> You can replace OpenAI with another LLM by editing the **Language Model** node in LangFlow (provider/model) and updating credentials accordingly.

---

## Troubleshooting

### Common Issues

#### `not_in_channel`

**Cause**: App/user token not a member of the target Slack channel.
**Solution**: In Slack, run `/invite @your-app` (or ensure the user token is in the channel).

#### `invalid_auth`

**Cause**: Wrong or expired Slack token.
**Solution**: Reinstall the app and copy the latest **User OAuth Token** (xoxp-…).

#### No Notion results / `403 Unauthorized`

**Cause**: DB not shared with your Notion integration.
**Solution**: Open the Notion DB → **Share** → **Invite** your integration.

#### Invalid/Non-strict JSON from LLM

**Cause**: LLM returned malformed Notion filter JSON.
**Solution**: Strengthen the system prompt to *return JSON only*; optionally add a validation step.

### Performance Tips

* Keep page size small (10–25) then paginate if needed.
* Narrow filters with Due date ranges.
* Cache frequent summaries externally if needed.

---

## 🔧 Creating Artifacts

### LangFlow Templates

1. Build and test your flow thoroughly.
2. Export from LangFlow as JSON → save as `artifacts/langflow-template.json`.

### Configuration Files

`artifacts/config.yaml` (example included):

```yaml
template:
  name: "notion-slack-task-summarizer"
  version: "1.0.0"
  description: "Natural language → Notion query → Slack summary"
  author: "Marcus Izumi"

environment:
  required:
    - OPENAI_API_KEY
    - NOTION_SECRET
    - NOTION_DATABASE_ID
    - SLACK_USER_TOKEN

services:
  notion:
    query_mode: "dynamic"
  slack:
    post_mode: "markdown"
  llm:
    provider: "openai"
    model: "gpt-4o"
    substitutable: true
```

### Code Snippets

If you included a custom Slack sender, place it in:

```
custom_components/slack_user_sender.py
```

Make sure it accepts **plain text** (string) and posts to `chat.postMessage` using `SLACK_USER_TOKEN`.

---

## 🧪 Testing Your Template

### Local Testing

* Use `examples/sample-input.json` and confirm Slack output matches `examples/sample-output.json`.
* Verify error handling with bad tokens or empty results.

### Documentation Review

* Ensure team members can reproduce in ≤10 minutes.
* Include clear token/scopes instructions.

### Quality Checklist

* [x] Template works as described
* [x] No hardcoded credentials
* [x] Error handling present
* [x] README clear and complete
* [x] Performance acceptable

---

## 📊 Template Categories

This template sits in **Collaboration** — team coordination, project updates, communication tooling.

---

## 🎨 Best Practices

* Keep system prompts strict about **valid JSON** output.
* Never commit tokens; use `.env` locally and **also** paste values into LangFlow fields.
* Add screenshots of your LangFlow graph in `README.md` (optional).

---

## 🚀 Publishing Your Template

### Final Review

* Re-test the flow end-to-end.
* Ensure `artifacts/langflow-template.json` and `artifacts/config.yaml` are present.
* Include `examples/sample-input.json` and `examples/sample-output.json`.

### Create Pull Request

* Include a concise description, prerequisites, and screenshots (optional).
* Note: Integration with the **official XC475 Notion workspace** is pending approval.

---

## 📚 Additional Resources

* **LangFlow**: [https://docs.langflow.org/](https://docs.langflow.org/)
* **Notion API**: [https://developers.notion.com/](https://developers.notion.com/)
* **Slack API**: [https://api.slack.com/](https://api.slack.com/)
* **OpenAI**: [https://platform.openai.com/](https://platform.openai.com/)

---

**Author:** Marcus Izumi
**Course:** XC475 – Software Engineering Project (Fall 2025)
**License:** MIT

```
::contentReference[oaicite:0]{index=0}
```
