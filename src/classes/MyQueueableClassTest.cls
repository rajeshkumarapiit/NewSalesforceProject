/**
 * Invoke with: ID jobId = System.enqueueJob(new MyQueueableClass()); 
 */
public class MyQueueableClassTest implements Queueable,  Database.AllowsCallouts {
    Integer i;
    public MyQueueableClassTest(Integer i) {
        this.i = i;
    }

    public void execute(QueueableContext context) {
        // Send GET request to google
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://google.com');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);

        System.debug('get response'+res.getBody());
        System.debug('i:'+i);

        if(i==0) {
            //System.enqueueJob(new MyQueueableClass(1));
        }
    }
}