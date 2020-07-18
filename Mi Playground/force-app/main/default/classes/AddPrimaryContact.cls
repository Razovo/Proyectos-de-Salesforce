public class AddPrimaryContact implements Queueable{
    private Contact objCon;
    private String strState;
    //Comentarios
    public AddPrimaryContact(Contact objCon , String strState){
        this.objCon = objCon;
        this.strState = strState;
    }
    
     public void execute(QueueableContext context) { 
         
         list<Contact> lstContAux = new list<Contact>();
         list<Contact> lstContAux2 = new list<Contact>();
         list<Account> lstAcc = [Select id, BillingState  FROM Account Where BillingState  =: strState Limit 200];
         
         for (Account objAcc : lstAcc){
             Contact objConAux = objCon.clone(false, false, false, false);
             objConAux.AccountId = objAcc.Id;
             lstContAux.add(objConAux);
             lstContAux2.add(objConAux);
         }
         insert lstContAux ;    
    }
    
}
