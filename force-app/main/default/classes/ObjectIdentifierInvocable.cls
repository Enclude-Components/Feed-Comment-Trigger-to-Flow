/**
 * @description		Contains invocable method to return the SObject API Name of a provided ID
 * @since			10/10/2024
 * @author			Brandon DeMatteis, Enclude
*/
public inherited sharing class ObjectIdentifierInvocable {
    /**
     * @description		Invocable method to return the SObject API Name of a provided ID
     * @param			recordIds   Id[] of records to return SObject API Name for
     * @return			String[]    List of SObject API Names
    */
    @InvocableMethod(label='Identify Object' description='Returns the SObject type for a given ID' iconName='slds:standard:sobject')
    public static String[] identifyObject(Id[] recordIds) {
        String[] objectTypes = new List<String>();
        if (recordIds == null) {
            return objectTypes;
        }
        for(Id recordId : recordIds) {
            objectTypes.add(recordId.getSObjectType().getDescribe().getName());
        }
        return objectTypes;
    }
}