/**
 * Invoke with: ID jobId = System.enqueueJob(new MyQueueableClass()); 
 */
public class MyQueueableClass implements Queueable,  Database.AllowsCallouts {
    Integer i;
    public MyQueueableClass(Integer i) {
        this.i = i;
    }

    public void execute(QueueableContext context) {
        // Send GET request to google
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://google.com');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);

        System.debug(res.getBody());
        System.debug('i:'+i);

        
       System.enqueueJob(new MyQueueableClassTest(1));
        
    }
}