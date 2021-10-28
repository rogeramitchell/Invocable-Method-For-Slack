public class PostSlackMessage {


	//Define the Invokable Action variables
	public class Message {

		@InvocableVariable(label='Token' description='An API authentication token, which can be found at https://api.slack.com/web')
		public String token;

		@InvocableVariable(label='Channel ID' description='Set to the Channel ID (not Channel Name) of where the post should appear.')
		public String channelId;

		@InvocableVariable(label='Post Contents' description='The text of the message that will appear as the post.')
		public String text;

	}

	@InvocableMethod(label='Post Message to Slack Channel'
					 description='This posts a message to a Slack channel as a user or bot.')

	public static void postMessage(List<Message> messageList) {
		
		for(Message m : messageList) {
		
            if(Limits.getFutureCalls() >= Limits.getLimitFutureCalls()) {
				System.debug(LoggingLevel.ERROR, 'Future callout limit exceeded. Skipping records.');
            } else {
                SlackUtils.postSlackMessageCallout(m.token, m.channelId, m.text);
            }
		}
	}
}