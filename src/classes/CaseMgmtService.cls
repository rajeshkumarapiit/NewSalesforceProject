@RestResource(urlMapping='/CaseManagement/v1/*')
global with sharing class CaseMgmtService
{

    @HttpPost
    global static string attachPic(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        
        //Blob picture = req.requestBody;
        system.debug('req.....'+req);
        return null;
   }
}