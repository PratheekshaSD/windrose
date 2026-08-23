import os
import json
import google.generativeai as genai

genai.configure(api_key=os.getenv("GEMINI_API_KEY"))



def classify_error(error_message):
    error_lower=error_message.lower()


    #check for time out or connection keywords- if found return a retry decsision
    if "timeout" in error_lower or "connection" in error_lower:
        return {"action": "retry","reasoning": "Transient network issue, safe to retry"}

    if "404" in error_lower:
        return {"action":"skip","reasoning":"Rescource not found. retrying won't help"}

    #nothing matched then return None
    return None

def ask_llm(error_message):
    prompt=f"""You are helping diagnose a data pipline failure.

    Error:{error_message}

    Classify this error and respond with ONLY valid JSON in this exact format, nothing else:
    {{"action":"retry","reasoning": "short explanation"}}

    Valid actions are: retry, skip, alert
    -retry: transient issue.worth trying again
    -skip: this specific case can't succeed, move on
    -alert: unclear or risky, a human should look at it
    """

    try:
        model=genai.GenerativeModel("gemini-3.6-flash")
        response=model.generate_content(prompt)

        response_text=response.text.strip() #gemini's reply
        response_text=response_text.replace("```json","").replace("```","").strip()

        result=json.loads(response_text)
        return result
    except Exception as e:
            return{"action":"alert","reasoning": f"LLM call failed or response unparseable: {e}"}