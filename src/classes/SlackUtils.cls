global class SlackUtils {
	
	@future(callout=true)
	global static void PostSlackMessageCallout (String slackToken, String slackChannel, String slackText, String slackUsername, String slackIconUrl) {

		// Set up the necessary components of the request URL
		String slackEndpoint = 'https://slack.com/api/chat.postMessage';

		slackText = EncodingUtil.urlEncode(slackText, 'UTF-8');
		slackUsername = EncodingUtil.urlEncode(slackUsername, 'UTF-8');
		slackIconUrl = EncodingUtil.urlEncode(slackIconUrl, 'UTF-8');

		// Building request URL
		slackEndpoint = slackEndpoint + 
			'?token=' + slackToken +
			'&channel=' + slackChannel +
			'&text=' + slackText +
			'&username=' + slackUsername +
			'&icon_url=' + slackIconUrl;

		Http h = new Http();

		HttpRequest req = new HttpRequest();
		req.setEndpoint(slackEndpoint);
		req.setMethod('GET');

		HttpResponse res = new HttpResponse();
		res = h.send(req);

	}
}