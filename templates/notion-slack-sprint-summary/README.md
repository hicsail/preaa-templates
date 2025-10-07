
# 🧩 Notion-to-Slack Task Summarizer (XC475 Sprint Dashboard Automation)

**Category:** Collaboration / Workflow Automation  
**Complexity:** Intermediate  
**PREAA Components:** LangFlow, OpenAI API (or equivalent LLM), Notion API, Slack API  
**Estimated Setup Time:** ≤10 minutes  

---

## 📘 Overview

This LangFlow template automatically summarizes **project tasks** stored in a Notion database and posts the results to **Slack**.  

It was built for **XC475 (Software Engineering Project)** as an enhancement to the team’s Notion sprint dashboard — allowing natural-language queries like:

> “Show all high-priority tasks due this week and who’s assigned.”

The workflow:
1. Parses the input instruction (natural language) using an **LLM**  
2. Generates a **Notion API query (JSON)** matching that request  
3. Fetches matching tasks from your **Notion Database**  
4. Summarizes key points (status, priority, owner, due date)  
5. Sends a formatted summary message to **Slack**

This provides a one-click daily/weekly report from your Notion dashboard into your team Slack workspace.

---

## 🧱 Architecture

```

Natural Language → LLM → Notion Query Builder → Notion Database → Summarizer → Slack Sender

```

- **LLM Component** — Converts natural instructions into Notion JSON query filters  
- **Notion Component** — Fetches tasks using the generated query  
- **Summarizer LLM** — Condenses and formats the results for readability  
- **Slack Sender** — Sends the summary as a Markdown message to a chosen channel  

---

## ⚙️ Prerequisites

Before running, you’ll need three API connections:

| Service | Purpose | Environment Variable | How to Get It |
|----------|----------|----------------------|----------------|
| **OpenAI API (or any LLM)** | Generates queries and summaries | `OPENAI_API_KEY` | [Create OpenAI key](https://platform.openai.com/api-keys). You can also replace this with **Anthropic**, **Perplexity**, or any other model by editing the LLM node in LangFlow. |
| **Notion API** | Reads tasks from your database | `NOTION_SECRET` | Go to [Notion Integrations](https://www.notion.so/my-integrations), create an internal integration, and copy the **Internal Integration Token**. Then share your database with that integration. |
| **Slack API** | Sends summary messages | `SLACK_USER_TOKEN` | Create a Slack app via [api.slack.com/apps](https://api.slack.com/apps). Under **OAuth & Permissions**, add these scopes:<br> - `chat:write` (post messages)<br> - `channels:read` (list channels)<br> Then install the app to your workspace and copy your **User OAuth Token** (starts with `xoxp-...`). |

> ⚠️ Make sure your Slack app (bot) is invited to the channel you want to post in using `/invite @your-app-name`.

---

## 🗂️ About the Notion Database

- This flow was designed around a **copy of the XC475 Sprint Dashboard Notion database**.
- You’ll need your own **Notion Database ID**, which you can find from your Notion page’s URL.  
  Example:  
```

[https://www.notion.so/yourworkspace/Task-Dashboard-28452a2c9ba781b395c8e78de0614215](https://www.notion.so/yourworkspace/Task-Dashboard-28452a2c9ba781b395c8e78de0614215)

````
→ The string after the last `/` (`28452a2c9ba781b395c8e78de0614215`) is your **Database ID**.

- You can duplicate that dashboard and use it as a sandbox until your team or instructor grants full integration permissions.

Set this as an environment variable:

```bash
NOTION_DATABASE_ID=28452a2c9ba781b395c8e78de0614215
````

---

## 🧩 Environment Setup

Create a `.env` file in your root directory:

```bash
OPENAI_API_KEY=sk-yourkeyhere
NOTION_SECRET=secret_your_notion_key
NOTION_DATABASE_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxx
SLACK_USER_TOKEN=xoxp-your-slack-user-token
```

LangFlow automatically loads environment variables for components that use `os.getenv()`.

---

## 🐳 Option 1 — Docker (Recommended)

Run LangFlow in a container with mounted artifacts and components.

```bash
docker run -it --rm \
  -p 7860:7860 \
  --env-file .env \
  -v $(pwd)/artifacts:/app/artifacts \
  -v $(pwd)/custom_components:/app/langflow/custom \
  langflowai/langflow:latest
```

Then visit: **[http://localhost:7860](http://localhost:7860)**

Import the `langflow-template.json` from the `artifacts/` folder.

---

## 💻 Option 2 — Local Python Environment

### 1. Install dependencies

```bash
pip install langflow openai requests python-dotenv
```

### 2. Run LangFlow with environment loading

```python
# start.py
from dotenv import load_dotenv
import subprocess

load_dotenv()
subprocess.run(["langflow", "run"])
```

Then run:

```bash
python start.py
```

---

## 🧠 Usage

1. Launch LangFlow (`http://localhost:7860`)
2. Import your flow (`artifacts/langflow-template.json`)
3. Verify:

   * Notion Node → uses `NOTION_SECRET` and `NOTION_DATABASE_ID`
   * Slack Node → uses `SLACK_USER_TOKEN`
   * LLM Node → connected to OpenAI or chosen provider
4. In the input node, type something like:

   ```
   Summarize all tasks assigned to Marcus that are still in progress.
   ```
5. The system will:

   * Generate a Notion filter JSON,
   * Fetch matching entries,
   * Summarize the results,
   * Post a Markdown report to Slack.

---

## 🧾 Configuration File Example

**`config.yaml`**

```yaml
template:
  name: "notion-slack-task-summarizer"
  version: "1.0.0"
  description: "LangFlow workflow that converts natural language into Notion database queries and posts task summaries to Slack."
  author: "Marcus Izumi"

environment:
  required:
    - OPENAI_API_KEY
    - NOTION_SECRET
    - SLACK_USER_TOKEN
    - NOTION_DATABASE_ID

services:
  notion:
    database_scope: "Tasks"
    query_mode: "dynamic"
  slack:
    post_mode: "markdown"
    channel_type: "public"
  llm:
    provider: "openai"
    model: "gpt-4o"
    substitutable: true
```

---

## 🧩 Example System Message for Query Generator

```text
You are a Notion query generator. 
Convert the user's natural-language task request into a valid Notion query JSON.

Include:
- "filter" for fields such as Status, Priority, Due, or Assignee.
- "sorts" for ordering (preferably by "Due" ascending).
Return only valid JSON.
```

Example Output:

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

## 🧩 Slack Authentication Explained

Your Slack app requires the following **OAuth scopes** to post messages and access channels:

| Scope           | Purpose                                  |
| --------------- | ---------------------------------------- |
| `chat:write`    | Send messages as the app or user         |
| `channels:read` | Retrieve channel IDs for posting         |
| `users:read`    | (optional) Lookup user info for mentions |

After creating the app and adding scopes:

1. Click **Install App to Workspace**
2. Copy the **User OAuth Token (xoxp-...)**
3. Store it in `.env` as `SLACK_USER_TOKEN`

> 🧠 Tip: If you want messages to appear under your **personal account name**, use a user token (`xoxp-`).
> If you want messages sent by the app bot, use a bot token (`xoxb-`) instead and adjust the Slack node code accordingly.

---

## 🧩 Testing the Slack Connection

Before running the full flow, test your token manually:

```bash
curl -X POST https://slack.com/api/chat.postMessage \
  -H "Authorization: Bearer $SLACK_USER_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"channel":"#general","text":"✅ Slack connection successful!"}'
```

If you see a message appear in Slack, your setup is good.

---

## 🧰 Troubleshooting

| Issue              | Cause                                 | Solution                                             |
| ------------------ | ------------------------------------- | ---------------------------------------------------- |
| `not_in_channel`   | App/bot not added to Slack channel    | `/invite @your-bot`                                  |
| `invalid_auth`     | Wrong token type                      | Ensure token starts with `xoxp-` or `xoxb-`          |
| `invalid_json`     | LLM generated malformed query         | Adjust system prompt or use validation node          |
| `403 unauthorized` | Notion DB not shared with integration | Re-share database with integration via “Connections” |
| `Timeout`          | Slow Notion response                  | Increase timeout in Notion component (default 60 s)  |

---

## ✅ Verification Checklist

* [x] LangFlow launches successfully
* [x] LLM generates valid JSON filters
* [x] Notion query returns results
* [x] Slack message posts to target channel
* [x] Environment loads correctly via `.env`
* [x] Reproducible setup ≤ 10 minutes

---

## 🧑‍💻 About This Project

This template was created by **Marcus Izumi** for the **XC475 Software Engineering course** at Boston University.
It serves as a prototype for integrating **AI-driven task summarization** with **Notion sprint dashboards**.
Currently awaiting approval to integrate directly with the **official class Notion workspace**.

---

**Author:** Marcus Izumi
**Instructor Reference:** XC475 / Fall 2025
**License:** MIT
**Repository:** PREAA Templates – `notion-slack-task-summarizer`

```

---

Would you like me to add a **short “Contribution / Pull Request Notes”** section for your submission (e.g., how reviewers can rebuild and test your component locally with your `custom_components/SlackUserSender.py`)?  
That helps make your PR look professional and reproducible for PREAA reviewers.
```
