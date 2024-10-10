/**
 * @description		Thin wrapper class for Flow.Interview system class. Allows for unit test mocking
 * @since			10/10/2024
 * @author			Brandon DeMatteis, Enclude
*/
public inherited sharing class FlowInvocationService {
    @TestVisible
    private Boolean doRun = !Test.isRunningTest();
    /**
     * @description		Invokes the Flow.Interview.createInterview method with the same signature
     * @param			flowName        String API name of the flow
     * @param           inputVariables  Map<String, Object> Flow input variables
     * @return			Flow.Interview
    */
    public Flow.Interview createFlowInterview(String flowName, Map<String, Object> inputVariables) {
        return Flow.Interview.createInterview(flowName, inputVariables);
    }
    /**
     * @description		Invokes the Flow.Interview.start method for the provided Flow.Interview
     * @param			interview       Flow.Interview to start
    */
    public void startFlow(Flow.Interview interview) {
        if (doRun) {
            interview.start();
        }
    }
}