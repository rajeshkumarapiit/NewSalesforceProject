public with sharing class uploadAttachments {
    
    public integer mapPosition;
    public string docName{get;set;}
    public string docDescription{get;set;}
    public set<integer> mapkeyValue{get;set;}
    public integer tobeDeleted{get;set;}
    private map<integer,blob> newAttachments ;
    public attachment attachFile{get;set;}
    public map<integer,string> documentNameMap{get;set;}
    public map<integer,string> documentDesMap{get;set;}
    public map<integer,string> documentBodyLMap{get;set;}
    private double totalFileSize = 0.0;
    public String ipAddress{get;set;}           
    public uploadAttachments(ApexPages.StandardController controller) {
        mapPosition = 0;
        newAttachments = new map<integer,blob>();
        documentNameMap =new map<integer,string>();
        documentDesMap = new map<integer,string>();
        documentBodyLMap = new map<integer,string>();
        attachFile = new attachment ();
        ipAddress = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');

        
        
        //attachWrapperMap = new map<integer,attachmentsProcess>();
        //attachWrapperMap.put(mapPosition ,new attachmentsProcess(mapPosition,new Attachment()));
        mapkeyValue = newAttachments.keyset();
    }
    public void addMoreRow(){
        
        //newAttachments.clear();
        //newAttachments.addAll(holdAttachment);
        //Integer attachNum=2;
        //for (Integer idx=0; idx<attachNum; idx++)
        //{
            //attachFile docName
            //docDescription
            if(attachFile.BodyLength > 1024*135){
                
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'You are trying to upload a file with size---'+decimal.valueof(attachFile.BodyLength)/1024));
                attachFile = new attachment ();
                
           }
           else{
                
                totalFileSize += attachFile.BodyLength;
                if(totalFileSize > 1024*125)
                {
                    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'You are trying to upload a file with size---'+decimal.valueof(attachFile.BodyLength)/1024) );
                    attachFile = new attachment ();   
                }
                else{
                    integer countMap = mapPosition++;
                    newAttachments.put(countMap,attachFile.body);
                    documentNameMap.put(countMap,attachFile.Name);
                    documentDesMap.put(countMap,attachFile.Description);
                    documentBodyLMap.put(countMap,decimal.valueof(attachFile.BodyLength)/1024+' KB');
                    attachFile = new attachment ();
                }
           }
            
        
        //}
        mapkeyValue = newAttachments.keyset();
    }
    
    public void deleteAttachment(){
        newAttachments.remove(tobeDeleted);
        mapkeyValue = newAttachments.keyset();
    }
    
   
    

}