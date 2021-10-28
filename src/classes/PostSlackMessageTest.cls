@isTest
public class PostSlackMessageTest {
    
    @isTest
    static PostSlackMessage.Message createMessage() {
    	
    	PostSlackMessage.Message messageTest = new PostSlackMessage.Message();
        
		messageTest.channelId = 'C09876543';
        messageTest.text = 'Hello this is a test';
        messageTest.token = 'x1234-1234567890-asdf';
        
        return messageTest;
        
    }

    @isTest
    static List<PostSlackMessage.Message> createMessages() {
        
        List<PostSlackMessage.Message> mList = new List<PostSlackMessage.Message>();
        Integer i;
        
        for(i = 0; i < 200; i++) {
            
            PostSlackMessage.Message messageTest = new PostSlackMessage.Message();
        
			messageTest.channelId = 'C09876543';
    	    messageTest.text = 'Hello this is a test';
        	messageTest.token = 'x1234-1234567890-asdf';
            
            mList.add(messageTest);
            
        }
        
        return mList;
    }
    
    @isTest
    static void singlePost() {
        
        List<PostSlackMessage.Message> mList = new List<PostSlackMessage.Message>();
        PostSlackMessage.Message m = createMessage();
        
        mList.add(m);
        
        Test.setMock(HttpCalloutMock.class, new PostSlackMessageTestMock.SuccessfulResponseMock());
        
        Test.startTest();
        PostSlackMessage.postMessage(mList);
        Test.stopTest();
    }
    
    @isTest
    static void multiplePost() {
        
        List<PostSlackMessage.Message> mList = createMessages();
        String exceptionMessage;

        Test.setMock(HttpCalloutMock.class, new PostSlackMessageTestMock.SuccessfulResponseMock());
        
        Test.startTest();
        PostSlackMessage.postMessage(mList);
        Test.stopTest();
    }
}