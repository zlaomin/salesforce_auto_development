public class test_value {
    List<String> names = new List<String>();
    public test_value(){
    List<Tests__c> tests = [SELECT name from Tests__c];
        for(Tests__c test:tests){
            names.add(test.name);
        }
 	}
    public List<String> getname(){
        
        return names;
    }
}