public class PostSlackMessage {

	public class Message {

		@InvocableVariable(label='Token' description='An API authentication token, which can be found at https://api.slack.com/web')
		public String token;

		@InvocableVariable(label='Channel ID' description='Set to the Channel ID (not Channel Name) of where the post should appear.')
		public String channelId;

		@InvocableVariable(label='Post Contents' description='The text of the message that will appear as the post.')
		public String text;

		@InvocableVariable(label='Bot Name' description='The name that appears next to the post along with the label "BOT".')
		public String username;

		@InvocableVariable(label='Bot Picture' description='A link to a photo that will be used as the bot\'s picture.')
		public String iconUrl;

	}

	@InvocableMethod(label='Post Message to Slack Channel'
					 description='This posts a message to a Slack channel as a user or bot. If posting as a bot, you can specify the avatar or emoji that accompanies the post.')
	public static void PostSlackMessage(List<Message> messageList) {

		for(Message m : messageList) {
			
            if(Limits.getFutureCalls() >= Limits.getLimitFutureCalls()) {
				System.debug(LoggingLevel.ERROR, 'Future callout limit exceeded. Skipping records.');
            } else {
                SlackUtils.PostSlackMessageCallout(m.token, m.channelId, m.text, m.username, m.iconUrl);
            }
		}
	}
}