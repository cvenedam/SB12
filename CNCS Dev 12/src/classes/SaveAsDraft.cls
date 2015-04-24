public class SaveAsDraft {
  Public Account account {get;set;}
  Public Id tempid;
    public SaveAsDraft(ApexPages.StandardController controller) {
    account= new Account();
    tempid=controller.getRecord().id;
    System.debug('vijay id'+tempid);
    if(tempid !=null){
    Account Temp = [SELECT Id, AccountNumber, AccountSource, Active__c, AnnualRevenue, BillingCity, BillingCountry, BillingLatitude, BillingLongitude, BillingPostalCode, BillingState, BillingStreet, Phone, Description, Draft__c
    FROM Account Where Id=:tempid Limit 1];
     account=Temp;   
     }            
    
    }
   Public PageReference SaveAsDraft(){
     account.Draft__c='true';
     
         try{
             upsert account;
             PageReference pg = new ApexPages.StandardController(account).view();
             pg.setRedirect(true);
             return pg;
            }
         Catch(DMLException e){
             return null;
         }
         
       }
   public PageReference Save(){
   
     account.Draft__c='False';
         try{
             upsert account;
             PageReference pg = new ApexPages.StandardController(account).view();
             pg.setRedirect(true);
             return pg;
           }
         Catch(DMLException e){
             return null;
         }
    
     }
}