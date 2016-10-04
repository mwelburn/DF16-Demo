public class FeaturedGroupsController {

    @AuraEnabled
    public static List<CollaborationGroup> getFeaturedGroups() {
        return [SELECT Id, Name, SmallPhotoURL 
                FROM CollaborationGroup];
// 				WHERE NetworkId =: Network.getNetworkId()];
    }
}