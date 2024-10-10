/**
 * @description		Tests FlowInvocationService.cls
*/
@IsTest
public class FlowInvocationService_TEST {

    @IsTest
    public static void createFlowInterview() {
        FlowInvocationService service = new FlowInvocationService();
        System.assertNotEquals(
            null,
            service.createFlowInterview(
                FeedCommentFlowInvocation.FLOW_NAME,
                new Map<String, Object>()
            ),
            'FlowInvocationService.createFlowInterview returned an unexpected result'
        );
    }

    @IsTest
    public static void startFlow() {
        FlowInvocationService service = new FlowInvocationService();
        service.doRun = true;
        Exception caughtException;
        try {
            service.startFlow(null);
        } catch(Exception e) {
            caughtException = e;
        }
        System.assertNotEquals(
            null,
            caughtException,
            'FlowInvocationService.startFlow returned an unexpected result'
        );
    }

}