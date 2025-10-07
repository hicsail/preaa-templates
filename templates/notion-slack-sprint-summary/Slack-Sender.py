from langflow.custom import Component
from langflow.io import MessageInput, StrInput, Output
import requests

class SlackUserSender(Component):
    display_name = "Slack User Sender"
    description = "Send messages to Slack as a user"
    icon = "slack"

    inputs = [
        StrInput(name="user_token", display_name="Slack User Token (xoxp-...)", required=True),
        StrInput(name="channel", display_name="Channel ID or Name", required=True),
        MessageInput(name="message", display_name="Message Input"),
        StrInput(name="username", display_name="Display Name (optional)", value="Marcus Izumi", advanced=True),
        StrInput(name="icon_emoji", display_name="Emoji Icon (optional)", value=":wave:", advanced=True),
    ]

    outputs = [
        Output(name="response", display_name="Slack Response", method="send_message")
    ]

    def send_message(self):
        import json
    
        # --- Debug who this token actually is ---
        auth_check = requests.get(
            "https://slack.com/api/auth.test",
            headers={"Authorization": f"Bearer {self.user_token}"},
        ).json()
        self.log(f"[DEBUG] Auth check: {json.dumps(auth_check, indent=2)}")
    
        if not auth_check.get("ok"):
            raise ValueError(f"Token auth failed: {auth_check}")
    
        # --- Extract text safely ---
        if hasattr(self.message, "text"):
            text = self.message.text
        else:
            text = str(self.message)
    
        payload = {
            "channel": self.channel,
            "text": text,
            "username": self.username,
            "icon_emoji": self.icon_emoji,
        }
    
        res = requests.post(
            "https://slack.com/api/chat.postMessage",
            headers={
                "Authorization": f"Bearer {self.user_token}",
                "Content-Type": "application/json",
            },
            json=payload,
        )
    
        self.status = f"Sent message as {self.username or 'User'} to {self.channel}"
        self.log(f"[DEBUG] Slack response: {json.dumps(res.json(), indent=2)}")
        return res.json()
