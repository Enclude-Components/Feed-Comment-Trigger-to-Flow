/**
 * @description		Invokes the flow Feed_Comment_Trigger_Flow with FeedComment[] Trigger.old and Trigger.new records
 * @since			10/10/2024
 * @author			Brandon DeMatteis, Enclude
*/
public inherited sharing class FeedCommentFlowInvocation {
    public static final String FLOW_NAME = 'Feed_Comment_Trigger_Flow';
    @TestVisible
    private FlowInvocationService flowInvocationService = new FlowInvocationService();
    /**
     * @description		Invokes the flow Feed_Comment_Trigger_Flow with FeedComment[] Trigger.old and Trigger.new records
     * @param			triggerOld      FeedComment[] Trigger.old records
     * @param			triggerNew      FeedComment[] Trigger.new records
    */
    public void run(FeedComment[] triggerOld, FeedComment[] triggerNew) {
        Map<String, Object> inputVariables = new Map<String, Object> {
            'feedCommentsOld' => triggerOld,
            'feedCommentsNew' => triggerNew
        };
        Flow.Interview interview = flowInvocationService.createFlowInterview(
            FLOW_NAME,
            inputVariables
        );
        flowInvocationService.startFlow(interview);
    }
}