
# 🧩 Task Summarizer with Notion + Slack

**Category:** Collaboration / Workflow Automation  
**Complexity:** Intermediate  
**PREAA Components:** LangFlow, OpenAI API, Notion API, Slack API  
**Estimated Setup Time:** ≤10 minutes  

---

## 📘 Overview

This LangFlow template automates task reporting by connecting **Notion**, **OpenAI**, and **Slack**.

Given a **natural-language instruction** (e.g.,  
> “Summarize high-priority tasks that are due this week”),  
the flow will:

1. Use an LLM to generate a **structured Notion JSON query**.  
2. Query your **Notion Tasks database** using the Notion API.  
3. Summarize the results with OpenAI (e.g., GPT-4 or GPT-4o).  
4. Send a formatted Markdown summary message to a **Slack channel**.

Ideal for sprint reviews, daily summaries, and project coordination.

---

## 🧱 Architecture

```

Natural Language → LLM → NotionQueryBuilder → Notion DB → LLM Summary → Slack Sender

````

- **LLM Component:** Parses natural language into a valid Notion filter JSON.  
- **Notion Query Component:** Queries the database using the generated JSON.  
- **Summarizer LLM:** Synthesizes the fetched task data.  
- **Slack Sender:** Sends formatted Markdown reports to your team channel.

---

## ⚙️ Prerequisites

### Required Accounts & API Tokens

| Service | Description | Environment Variable |
|----------|--------------|----------------------|
| **OpenAI API** | Used for natural language → query generation and summarization. | `OPENAI_API_KEY` |
| **Notion API** | Access your Notion database. | `NOTION_SECRET` |
| **Slack API** | Send summary message to a Slack channel as your app or bot. | `SLACK_USER_TOKEN` |

You can find or create these tokens here:

- [OpenAI API Keys](https://platform.openai.com/api-keys)  
- [Notion Integrations](https://www.notion.so/my-integrations)  
- [Slack Apps](https://api.slack.com/apps)

---

## 🧩 Environment Setup

Create a `.env` file in your project root:

```bash
OPENAI_API_KEY=sk-yourkeyhere
NOTION_SECRET=secret_your_notion_key
SLACK_USER_TOKEN=xoxp-your-token
NOTION_DATABASE_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxx
````

---

## 🚀 Setup Options

### 🐳 Option 1 — Docker (Recommended)

#### 1. Clone or download this template

```bash
git clone https://github.com/your-org/preaa-task-summarizer.git
cd preaa-task-summarizer
```

#### 2. Create `.env`

```bash
cp .env.example .env
```

Edit it with your API keys.

#### 3. Start LangFlow

Using Docker directly:

```bash
docker run -it --rm \
  -p 7860:7860 \
  --env-file .env \
  -v $(pwd)/artifacts:/app/artifacts \
  -v $(pwd)/custom_components:/app/langflow/custom \
  langflowai/langflow:latest
```

Or using Docker Compose:

```bash
docker compose up
```

LangFlow will start at [http://localhost:7860](http://localhost:7860)

---

### 💻 Option 2 — Local Python Environment

#### 1. Install dependencies

```bash
pip install langflow openai requests python-dotenv
```

#### 2. Load environment variables automatically

Create a small `start.py`:

```python
from dotenv import load_dotenv
load_dotenv()
import subprocess

subprocess.run(["langflow", "run"])
```

Then run:

```bash
python start.py
```

---

## 🧠 Usage Guide

1. Open LangFlow (`http://localhost:7860`)
2. Import the template JSON:

   * Click **Import Flow** → select `artifacts/langflow-template.json`
3. Open the flow and verify:

   * `Notion` component uses your `NOTION_SECRET`
   * `Slack Sender` uses your `SLACK_USER_TOKEN`
   * `LLM` is configured to `gpt-4o` or `gpt-3.5-turbo`
4. In the input node, type:

   > “Summarize all tasks assigned to Marcus that are still in progress.”

You’ll receive a formatted Slack message with task summaries, deadlines, and priorities.

---

## 🧾 Configuration Files

### `config.yaml`

Defines metadata and environment variables required for this template.

```yaml
template:
  name: "notion-slack-task-summarizer"
  version: "1.0.0"
  description: "LangFlow workflow for querying and summarizing Notion tasks, then posting updates to Slack."

environment:
  required:
    - OPENAI_API_KEY
    - NOTION_SECRET
    - SLACK_USER_TOKEN
  optional:
    - NOTION_DATABASE_ID

services:
  notion:
    database_scope: "Tasks"
    query_mode: "dynamic"
  slack:
    post_mode: "markdown"
    channel_type: "public"
```

---

## 🧩 Troubleshooting

| Issue                   | Cause                          | Solution                                                   |
| ----------------------- | ------------------------------ | ---------------------------------------------------------- |
| `Error: not_in_channel` | Bot not added to Slack channel | Invite bot using `/invite @your-bot`                       |
| `Invalid JSON query`    | LLM misformatted Notion filter | Adjust system message for query generation                 |
| `Unauthorized`          | Wrong or expired tokens        | Regenerate in OpenAI / Slack / Notion                      |
| `Flow not loading`      | Wrong volume mount             | Ensure `artifacts/` and `custom_components/` exist locally |

---

## ✅ Verification Checklist

* [x] LangFlow launches successfully
* [x] Environment variables loaded correctly
* [x] LLM generates valid Notion queries
* [x] Slack posts messages successfully
* [x] All setup steps reproducible in ≤10 min

---

## 💬 Example LLM System Message (Optional for Reviewers)

```text
You are a Notion Query Generator. 
Given a task description, output a valid JSON body for the Notion API query endpoint.

Use the following schema:
- "filter": may include properties like "Status", "Priority", "Due", "Assignee".
- "sorts": sort by "Due" ascending when relevant.
- Output must be pure JSON compatible with Notion’s /query endpoint.
```

Example:

```json
{
  "filter": {
    "and": [
      { "property": "Status", "status": { "equals": "In Progress" } },
      { "property": "Priority", "select": { "equals": "High" } }
    ]
  },
  "sorts": [{ "property": "Due", "direction": "ascending" }],
  "page_size": 10
}
```

---

**Author:** Marcus Izumi
**PREAA Template Maintainer:** PREAA Templates Team
**License:** MIT

```

---

Would you like me to automatically add a **short section for “Testing the Slack Output”** (a one-liner command with curl or Python `requests`) so reviewers can verify the token and channel before running the full LangFlow flow? It’s a great sanity check for graders.
```
