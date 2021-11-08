
# Invocable Method For Slack

<a href="https://githubsfdeploy.herokuapp.com?owner=rogeramitchell&repo=Invocable-Method-For-Slack">
    <img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

- Post to Slack channels as a bot by way of declarative or custom development. 
- Post to Slack workflows, passing variable values, by way of declarative or custom development. 
- A great tool for admins wishing to post from flow to Slack without writing code.
- This is a general purpose "salesforce-to-slack" "Invocable Action".

# Steps to Implement

## Load these Classes into your Salesforce Org
* git clone this repository to your desktop
* create an sfdx project in a new folder
* add these classes to the class directory of your salesforce project
* sfdx deploy the project up to your org

## Design the Slack Message Layout
* Design a message template using the slack BlockKit Builder: https://app.slack.com/block-kit-builder/T01GST6QY0G
![Add Invocable Action](/images/blockKitBuilder.jpg)


## Create a Flow and Flow Variable
* Create a flow to be triggered using criteria you desire, on the object you choose.
* Create a salesforce flow variable of type "Text Template". 
** *Make sure you view the text in "Plain Text"* This will remove all the extra HTML formatting added to Rich Text fields, which slack will reject.
* Paste the template BlockKit text into the variable's Body field.
* Use the 'Insert a Resource' field to add the necessary merge fields, to include for values from salesforce: record name = {!record.name}, etc...
* * Note that $record in flow always has a reference to the record that triggered the flow - from there you can reach up to related records' fields (account, contact, etc...)
* Save the variable / Click Done.
![Add a Flow TextTemplate Variable](/images/textTemplate.jpg)

## Create the Flow Action
* Add an action to the screen, and choose this SlackInvocableAction as the action.
* Populate the necessary input fields with the bot token, the TextTemplate variable from above, and bot/workflow URL
* Save the action (click Done) and connect it to your flow. 
![Add Invocable Action](/images/addSlackAction.jpg)

## Add a Remote Site
In order to allow your callout, you need to add https://hooks.slack.com to your list of remote sites, in salesforce Setup.
![Add Remote Site](/images/remoteSite.jpg)

## Debug the Flow
* Ensure that you are not getting a 404 or 400 error, and examine the Payload text from the TextTemplate variable, which now includes the merged data fields.
![Debug the Flow](/images/debug.jpg)

## Activate the Flow
* If all is well, you will see your debug post in your channel. It is working! 
* Now you can activate your flow, and it will fire using the Triggering Criteria in your flow definition.

## Notes on Workflows vs. Bots
* Bots can receive the BlockKit payload as is, but workflows require a different approach, using this same solution:

In slack, create a workflow and variables:
* Create a workflow
* Create variables for the workflow

In salesforce, you use a different text format
* In the TextTemplate variable, instead of pasting JSON, you just past a set of name value pairs, like below. Each name, like "account_name" is an exact match for the variable names you created in slack: 
* `{
"account_name": "{!$Record.Account.Name}",
"account_link": "{!AccountLink}",
"opportunity_name": "{!$Record.Name}",
"opportunity_link": "{!OpptyLink}",
"country": "{!$Record.Account.BillingCountry}",
"industry": "{!$Record.Account.Industry}",
"opportunity_owner": "{!RecordOwnerFirstLast}"
}
`

## Notes on Debugging
The message will post to slack as long as you have 
1. the right token, 
1. and bot URL, 
1. a remote site, 
1. and a well formatted message

Most issues encountered were related to poorly formatted JSON messages (missing quotes, extra commas, salesforce field values that were blank). If your message is bad, you will see a 404 error in the output area of the Debug step.
