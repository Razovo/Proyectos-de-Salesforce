global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator('SELECT id, LeadSource FROM Lead' );
	}
    
    global void execute(Database.BatchableContext BC, List<Lead> scope) {
         
        for (Lead objLead : scope){
            System.debug('objLead '+objLead);	
            objLead.LeadSource = 'Dreamforce';
        }
        
        update scope;
    }
    
    global void finish(Database.BatchableContext BC) {	
    
    }
    
    

}