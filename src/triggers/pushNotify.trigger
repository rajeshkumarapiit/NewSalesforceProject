trigger pushNotify on Event (after insert) {
    for(event ev:trigger.new){
    // Instantiating a notification
    Messaging.PushNotification msg = new Messaging.PushNotification();
    // Assembling the necessary payload parameters for Apple.
    // Apple params are:
    // (<alert text>,<alert sound>,<badge count>,
    // <free-form data>)
    // This example doesn't use badge count or free-form data.
    // The number of notifications that haven't been acted
    // upon by the intended recipient is best calculated
    // at the time of the push. This timing helps
    // ensure accuracy across multiple target devices.
    /*Map<String, Object> payload =  Messaging.PushNotificationPayload.apple('Event' + ev.id +
     ' status changed to: ev.Status', '', null, null);*/
    // Adding the assembled payload to the notification
    
    Map<String, Object> androidPayload = new Map<String, Object>();
    androidPayload.put('number', 1);
    androidPayload.put('name', 'test');
    msg.setPayload(androidPayload);
    // Getting recipient users
    String userId1 = ev.OwnerId;
    String userId2 = ev.LastModifiedById;
    // Adding recipient users to list
    Set<String> users = new Set<String>();
    users.add(userId1);
    
    users.add(userId2);
    // Sending the notification to the specified app and users.
    // Here we specify the API name of the connected app.
    msg.send('PushNotify', users);
    
    
   } 
   
    
    
}