public class FeaturedUsersController {

    @AuraEnabled
    public static List<UserWrapper> getFeaturedUsers() {
        List<User> users = [SELECT Id, FirstName, LastName, Name, CommunityNickname, SmallPhotoUrl FROM User WHERE Profile.Name = 'DF16 Customer Community Plus User' AND Id !=: UserInfo.getUserId() LIMIT 5];
        
        return UserWrapper.init(users);
    }
}