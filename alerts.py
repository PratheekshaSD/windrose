import os
import sendgrid
from sendgrid.helpers.mail import Mail
from dotenv import load_dotenv

load_dotenv()

def send_alert(subject, body):
    sg = sendgrid.SendGridAPIClient(api_key=os.getenv("SENDGRID_API_KEY"))
    email = Mail(
        from_email=os.getenv("ALERT_EMAIL"),
        to_emails=os.getenv("ALERT_EMAIL"),
        subject=subject,
        plain_text_content=body
    )
    sg.send(email)

