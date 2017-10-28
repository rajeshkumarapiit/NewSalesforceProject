public with sharing class rajesh_SessionOut {
    
    public rajesh_SessionOut (){
    
        list<AuthSession >authse =[SELECT SessionType,UsersId FROM AuthSession where UsersId =:userinfo.getuserId()];
    }
    public void logOutUser() {
        list<AuthSession >authse =[SELECT SessionType,UsersId FROM AuthSession where UsersId =:userinfo.getuserId()];
        
        system.debug(loggingLevel.Error,'authse ......._'+authse );
        delete authse ;
        
    }




}