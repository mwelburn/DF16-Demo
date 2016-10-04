public class UserWrapper {
    private User theUser;
    
    @AuraEnabled
    public String name {get; private set;}
    @AuraEnabled
    public String smallPhotoUrl {get; private set;}
    
    public UserWrapper(User myUser) {
        theUser = myUser;
        
        // Salesforce is smart enough to return the Name field appropriately
        // based on configuration...but it can't stop you from exposing First
        // and Last Name fields

        smallPhotoUrl = theUser.SmallPhotoUrl;
// TODO - if you want to do first name or nickname, query for setting and do if statement
        name = theUser.LastName + ', ' + theUser.FirstName; // TODO: Fix - theUser.Name

/*
        if ([SELECT COUNT() 
				FROM Network 
				WHERE Id =: Network.getNetworkId() 
					AND OptionsNicknameDisplayEnabled = TRUE] > 0) {

            name = theUser.Name;
        } else {
            name = theUser.LastName + ', ' + theUser.FirstName;
        }
*/
    }
    
    public static List<UserWrapper> init(List<User> users) {
        List<UserWrapper> userWrappers = new List<UserWrapper>();
        
        for (User theUser : users) {
            userWrappers.add( new UserWrapper(theUser) );
        }
        
        return userWrappers;
    }
}