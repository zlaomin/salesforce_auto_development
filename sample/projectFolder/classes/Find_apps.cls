public class Find_apps {
    String company_name;
    List<Company_apps__c> apps_list= new List<Company_apps__c>();
    public Find_apps(){
        String account_id = ApexPages.currentPage().getParameters().get('id');
        if (account_id != Null)
        {
            company_name = 
            [SELECT Company_name__c FROM Account WHERE Id = :account_id].company_name__c;
        
        //use : to refer var
        apps_list = 
            [SELECT Name,app_category__c,app_id__c,current_download__c,current_revenue__c,
             previous_week_download__c,previous_week_revenue__c 
             FROM Company_apps__c WHERE Company_name__c = :company_name];
        }
        else{
             apps_list = 
            [SELECT Name,app_category__c,app_id__c,current_download__c,current_revenue__c,
             previous_week_download__c,previous_week_revenue__c 
             FROM Company_apps__c];
        }
}
    public List<Company_apps__c> getapps(){
        return apps_list;
    }
    public String getcompany_name(){
        return company_name;
    }
}