@isTest
public class AddPrimaryContactTest {
    
   static testmethod void testOne(){
        
        list<Account> listAcc = new list<Account>();
        
        for(Integer i = 0 ; i<50 ; i++ ){
            Account acc = new account(Name = 'Acme '+i, Description = 'Acme Account', BillingState  = 'NY');
            listAcc.add(acc);
        }
        
        for(Integer i = 0 ; i<50 ; i++ ){
            Account acc = new account(Name = 'Acme '+i, Description = 'Acme Account', BillingState  = 'CA');
            listAcc.add(acc);
        }
       insert listAcc;
        Contact con = new Contact(firstname = 'test new', lastname='test con',email='lnarasimha823@gmail.com');
        AddPrimaryContact objAddPO = new AddPrimaryContact(con, 'CA');
        ID jobID = System.enqueueJob(objAddPO);
    }

}