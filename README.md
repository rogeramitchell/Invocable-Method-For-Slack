Create posts in slack using salesforce flow. 

This is a general purpose "salesforce-to-slack" "Invocable Action".

# Invocable-Method-For-Slack
Post to Slack channels as a bot by way of declarative or custom development. 
Post to Slack workflows, passing variable values, by way of declarative or custom development. 
A great tool for admins wishing to post from flow to Slack without writing code.

# Steps to implement:

## Load these classes into your salesforce org.
* git clone this repository to your desktop
* create an sfdx project in a new folder
* add these classes to the class directory of your salesforce project
* sfdx deploy the project up to your org

# Design the message layout:
* Design a message template using the slack BlockKit Builder: https://app.slack.com/block-kit-builder/T01GST6QY0G
![Add Invocable Action](/images/blockKitBuilder.jpg)
Format: ![design the message using Block Kit Builder]


## Create a Flow and Flow variable
* Create a flow to be triggered using criteria you desire, on the object you choose.
* Create a salesforce flow variable of type "Text Template". *make sure you view the text in "Plain Text"* this will remove all the extra HTML formatting added to Rich Text fields, which slack will reject.
* Paste the template BlockKit text into the variable.
* Replace the necessary text with merge fields for values from salesforce: record name = {!record.name}, etc...
* Save the variable.
![Add Invocable Action](/images/textTemplate.jpg)

## Create the Flow Action
* Add an action to the screen, and choose this SlackInvocableAction as the action.
* Populate the necessary input fields with the bot token, the TextTemplate variable from above, and bot/workflow URL
* Save the action and connect it to your flow. 
![Add Invocable Action](/images/addSlackAction.jpg)

## Debug the flow. 
* Ensure that you are not getting a 404 or 400 error, and examine the Payload text from the TextTemplate variable, which now includes the merged data fields.
![Add Invocable Action](/images/debug.jpg)

## Notes on Workflows vs Bots
Bots can receive the BlockKit payload as is, but workflows require a different approach, using this same solution:

In slack:
* Create a workflow
* Create variables for the workflow

In salesforce
* In the TextTemplate variable, instead of pasting JSON, you just past a set of name value pairs, like this: `{
"account_name": "{!$Record.Account.Name}",
"account_link": "{!AccountLink}",
"opportunity_name": "{!$Record.Name}",
"opportunity_link": "{!OpptyLink}",
"country": "{!$Record.Account.BillingCountry}",
"industry": "{!$Record.Account.Industry}",
"opportunity_owner": "{!RecordOwnerFirstLast}"
}
`
