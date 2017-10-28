public class pushNotify{

    public static void pushN(id userId,string message){
        ConnectApi.MessageBodyInput messageInput = new ConnectApi.MessageBodyInput();
        messageInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
         
        // create and add the mention segment
        ConnectApi.MentionSegmentInput mentionSegment = new ConnectApi.MentionSegmentInput();
        mentionSegment.id = userId;
        messageInput.messageSegments.add(mentionSegment);
         
        // create and add the message body segment
        ConnectApi.TextSegmentInput textSegment;
        textSegment = new ConnectApi.TextSegmentInput();
        textSegment.text = message;
        messageInput.messageSegments.add(textSegment);
         
        // create the FeedItemInput and add the messageInput to it
        ConnectApi.FeedItemInput input = new ConnectApi.FeedItemInput();
    
    }
    /******************************************************************************************************************************************************************
    @Description: Contains all before delete logic for all object record
    ******************************************************************************************************************************************************************/
    public static void beforDeleteRecord(){
        
        for(sobject acc:trigger.old){
           
                    acc.addError('label.deletionError');
            
        }//for loop end 
    }//method end

}