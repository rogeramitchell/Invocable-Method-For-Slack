public class SlackUtils {
	
	//@future(callout=true)
	public static void postSlackMessageCallout (String slackToken, String slackChannel, String slackText) {

		// Set up the necessary components of the request URL
		String slackEndpoint = 'https://hooks.slack.com/';
		
		// Building request URL
		slackEndpoint = slackEndpoint + slackChannel;

		Http h = new Http();

		HttpRequest req = new HttpRequest();
		req.setEndpoint(slackEndpoint);
		req.setHeader('Authentication', 'Bearer: '+slackToken);
		req.setMethod('POST');

		//pass in the Payload
		req.setBody(slackText);

		HttpResponse res = new HttpResponse();
		
		try{
			res = h.send(req);
		}catch (DmlException e)
		{
			System.debug('Exception: ' + e.getMessage() );
		}
		
	}
}