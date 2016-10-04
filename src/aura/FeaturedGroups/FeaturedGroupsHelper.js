({
	getFeaturedGroups : function(component) {
		var action = component.get("c.getFeaturedGroups");
        // TODO: Add configurable parameters
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
	            var data = response.getReturnValue();
                console.log(data[0]);
	            component.set("v.groups", data);   
            } else if (response.getState() === "ERROR") {
                // TODO: Error Message
            }
        });
        $A.enqueueAction(action);
	}
})