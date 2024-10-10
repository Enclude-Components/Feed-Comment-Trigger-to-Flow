trigger FeedComment on FeedComment (after insert, after update) {
    FeedCommentFlowInvocation invocationService = new FeedCommentFlowInvocation();
    invocationService.run(Trigger.old, Trigger.new);
}