trigger trigger_Test on test__c (before delete) {

  /* for(test__c accountDel :trigger.old)
    {
        accountDel.Name.addError('please contact to system admin');    
    }*/
    pushNotify.beforDeleteRecord();
    
}