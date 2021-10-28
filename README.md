#This is a general purpose salesforce to slack posting "Invocable Action".

Steps to implement:

#Load these classes into your salesforce org.

#Design the message layout:
Design a message template using the slack BlockKit Builder: https://app.slack.com/block-kit-builder/T01GST6QY0G

#Create a Flow and Flow variable
Create a flow to be triggered using criteria you desire, on the object you choose.
Create a salesforce flow variable of type "Text Template". *make sure you view the text in "Plain Text"* this will remove all the extra HTML formatting added to Rich Text fields, which slack will reject.
Paste the template BlockKit text into the variable.
Replace the necessary text with merge fields for values from salesforce: record name = {!record.name}, etc...
Save the variable.

#Create the Flow Action
Add an action to the screen, and choose this SlackInvocableAction as the action.
Populate the necessary input fields with the bot token, the TextTemplate variable from above, and bot/workflow URL
Save the action and connect it to your flow. 
![Add Invocable Action](/images/addSlackAction.png)
Format: ![Adding a Slack Action]

#Debug the flow. 
Ensure that you are not getting a 404 or 400 error, and examine the Payload text from the TextTemplate variable, which now includes the merged data fields.

Debug the 

# Invocable-Method-For-Slack
Post to Slack channels as a bot by way of declarative or custom development. 
Post to Slack workflows, passing variable values, by way of declarative or custom development. 
A great tool for admins wishing to post from flow to Slack without writing code.

