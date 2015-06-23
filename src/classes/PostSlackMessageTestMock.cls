@isTest
global class PostSlackMessageTestMock {
    
    global class SuccessfulResponseMock implements HttpCalloutMock {
        
        global HttpResponse respond(HttpRequest req) {
            
            String body = 
            '{' +
    			'"ok": true,' +
            	'"channel": "C09876543",' +
    			'"ts": "1234567890.000001",' + 
                '"message": {' +
                    '"text": "Hello this is a test"' +
                    '"username": "SalesforceTestClass",' +
                    '"type": "message",' +
                    '"subtype": "bot_message",' +
                    '"ts": "1234567890.000001"' +
    			'}' +			
			'}';
            
            HttpResponse res = new HttpResponse();
            
            res.setBody(body);
            
            return res;
        }
    }
}