public class big_object {
    public big_object(){
    }
    Public List<Double> getobj(){
        List<Double> names = new List<Double>();
        List<Big_Object__b> tests=[SELECT Num__c FROM Big_object__b WHERE Num__c=19999.0];
        System.debug(tests);
        for(Big_Object__b test:tests){
            names.add(test.Num__c);
        }
        return names;
        
    }
}