/**
 * @description		Tests ObjectIdentifierInvocable.cls
*/
@IsTest
public class ObjectIdentifierInvocable_TEST {

    private static Integer idNumber = 0;

    @IsTest
    public static void identifyObject() {

        String[] nullResults = ObjectIdentifierInvocable.identifyObject(null);
        System.assertEquals(
            0,
            nullResults?.size(),
            'ObjectIdentifierInvocable.identifyObject should return an empty list of provided null results'
        );

        Id accountId = getMockId(Account.getSObjectType());
        Id contactId = getMockId(Contact.getSObjectType());

        String[] results = ObjectIdentifierInvocable.identifyObject(
            new List<Id> {
                accountId,
                contactId
            }
        );

        System.assertEquals(
            2,
            results?.size(),
            'ObjectIdentifierInvocable.identifyObject returned an unexpected result'
        );
        System.assertEquals(
            'Account',
            results.get(0),
            'ObjectIdentifierInvocable.identifyObject returned an unexpected result'
        );
        System.assertEquals(
            'Contact',
            results.get(1),
            'ObjectIdentifierInvocable.identifyObject returned an unexpected result'
        );
    }

    public static String getMockId(Schema.SObjectType sObjectType) {
        String result = String.valueOf(idNumber++);
        return sObjectType.getDescribe().getKeyPrefix() +
          '0'.repeat(12 - result.length()) +
          result;
    }

}