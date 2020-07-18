@isTest
public class DailyLeadProcessorTest {

    private static testmethod void testOne(){
        
        List<Lead> lstAux = new List<Lead>();
        for(Integer i= 0; i<200 ; i++){
            Lead objLead = new Lead(Company = 'JohnMiller '+i, LastName = 'Mike '+i, Status = 'Open', LeadSource = null);
            lstAux.add(objLead);
        }
             
        insert lstAux;
        
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
    }
}