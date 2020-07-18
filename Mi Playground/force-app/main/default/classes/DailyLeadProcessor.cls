public class DailyLeadProcessor implements Schedulable{
	
    public void execute(SchedulableContext ctx){
        
    	List<Lead> lstLead = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null or LeadSource = ''  Limit 200];
        for(Lead objLead : lstLead){
            objLead.LeadSource = 'Dreamforce';
        }
        update lstLead;
        
    }
    
}