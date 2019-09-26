public class App_detail {
    String company_name;
    List<Data> linedata = new List<Data>();
    List<PieWedgeData> piedata = new List<PieWedgeData>();
    List<Company_apps__c> apps_list= new List<Company_apps__c>();
    public App_detail(){
        company_name = ApexPages.currentPage().getParameters().get('company_name');
        //use : to refer var
        apps_list = 
            [SELECT Name,app_category__c,app_id__c,current_download__c,current_revenue__c,
             previous_week_download__c,previous_week_revenue__c 
             FROM Company_apps__c WHERE Company_name__c = :company_name];
        for(Company_apps__c app : apps_list){
            piedata.add(new PieWedgeData(app.Name, app.current_download__c));
            linedata.add(new Data(app.Name,app.previous_week_download__c,app.current_download__c));
        }
}
    public List<Company_apps__c> getapps(){
        return apps_list;
    }
    public String getcompany_name(){
        return company_name;
    }
    public List<PieWedgeData> getPieData() {
        return piedata;
    }

    // Wrapper class
    public class PieWedgeData {

        public String name { get; set; }
        public Decimal data { get; set; }

        public PieWedgeData(String name, Decimal data) {
            this.name = name;
            this.data = data;
        }
    }
     public List<Data> getLineData() {      
        return linedata;
    }
    
    // Wrapper class
    public class Data {
        public String name { get; set; }
        public decimal data1 { get; set; }
        public decimal data2 { get; set; }
        public Data(String name, decimal data1, decimal data2) {
            this.name = name;
            this.data1 = data1;
            this.data2 = data2;
        }
    }
}