/**
 * @description		Tests FeedCommentFlowInvocation.cls
*/
@IsTest
public class FeedCommentFlowInvocation_TEST {
    @IsTest
    public static void run() {
        MockFlowInvocationService mockFlowService = new MockFlowInvocationService();

        FeedCommentFlowInvocation feedCommentFlowService = new FeedCommentFlowInvocation();
        feedCommentFlowService.flowInvocationService = (FlowInvocationService)Test.createStub(
            FlowInvocationService.class,
            mockFlowService
        );

        feedCommentFlowService.run(
            new List<FeedComment>(),
            new List<FeedComment>()
        );

        System.assertEquals(
            FeedCommentFlowInvocation.FLOW_NAME,
            mockFlowService.interviewName,
            'FeedCommentFlowInvocation.run created a Flow.Interview with unexpected arguments'
        );
        System.assertEquals(
            true,
            mockFlowService.interviewArgs?.containsKey('feedCommentsOld'),
            'FeedCommentFlowInvocation.run created a Flow.Interview with unexpected arguments'
        );
        System.assertEquals(
            true,
            mockFlowService.interviewArgs?.containsKey('feedCommentsNew'),
            'FeedCommentFlowInvocation.run created a Flow.Interview with unexpected arguments'
        );
        System.assertEquals(
            true,
            mockFlowService.startFlowWasCalled,
            'FeedCommentFlowInvocation.run should start the Flow.Interview'
        );
    }
    private class MockFlowInvocationService implements StubProvider {
        public String interviewName;
        public Map<String, Object> interviewArgs;
        public Boolean startFlowWasCalled = false;
        public Object handleMethodCall( //NOPMD
            Object stubbedObject,
            String stubbedMethodName,
            System.Type returnType,
            System.Type[] listOfParamTypes,
            String[] listOfParamNames,
            Object[] listOfArgs
        ) {
            if (stubbedMethodName == 'createFlowInterview') {
                interviewName = (String)listOfArgs.get(0);
                interviewArgs = (Map<String, Object>)listOfArgs.get(1);
            }
            if (stubbedMethodName == 'startFlow') {
                startFlowWasCalled = true;
            }
            return null;
        }
        private Flow.Interview handleCreateFlowInterview(String flowName, Map<String, Object> inputVariables) {
            return Flow.Interview.createInterview(flowName, inputVariables);
        }
    }
}