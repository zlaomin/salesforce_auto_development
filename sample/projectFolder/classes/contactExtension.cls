public class contactExtension {
    private String id;
    private final Contact contact;
    public String js_company_id;
    public String js {get{return js_company_id;}}
    public contactExtension (ApexPages.StandardController stdController){
        
    }
    public void Getcompanyname(String company_id){
        js_company_id = company_id;
    }
    
}