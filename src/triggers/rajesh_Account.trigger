trigger rajesh_Account on Account(before insert,after insert,before update,after update,before delete,after delete) {
    TriggerFactory.createHandler(account.sObjectType);    
}