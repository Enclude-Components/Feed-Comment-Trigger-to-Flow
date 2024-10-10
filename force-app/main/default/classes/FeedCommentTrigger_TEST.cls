/**
 * @description		Tests FeedComment.trigger
*/
@IsTest
public class FeedCommentTrigger_TEST {
    @IsTest
    public static void triggerTest() {
        Exception caughtException;
        try {
            CollaborationGroup  testRecord = new CollaborationGroup(
                Name = 'Test Group',
                CollaborationType = 'Public'
            );
            insert testRecord;

            FeedItem feedItem = new FeedItem(
                Body = 'Test Body',
                ParentId = testRecord.Id
            );
            insert feedItem;
            
            FeedComment feedComment = new FeedComment(
                CommentBody = 'Test Comment',
                FeedItemId = feedItem.Id
            );
            insert feedComment;
            
        } catch(Exception e) {
            caughtException = e;
        }
        System.assertEquals(
            null,
            caughtException,
            'FeedComment trigger should execute without exception'
        );
    }
}