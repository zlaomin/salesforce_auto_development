public class testController {
    private Animal__c  animal;
    public testController(){
    }
    public List<String> getData(){
        String temp;
        List<String> animals;
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() == 200) {
   		// Deserialize the JSON string into collections of primitive data types.
    		Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
    	// Cast the values in the 'animals' key as a list
    		animals = (List<String>) results.get('animals');
        }
      	return animals;
    }
}