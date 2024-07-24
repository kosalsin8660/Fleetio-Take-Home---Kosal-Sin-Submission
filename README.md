UI Test Automation using XCUITest Framework on Fleetio Go iOS app

Please download Xcode & run the FleetioGoUITests Test Class located within the Tests folder 

Here is an overview of the contents in the repository

Tests Folder  - Contains the main Test Class to run the iOS End to End Tests From
Common Folder - Contains the Base Test Class & the Test Logins 
Page Objects Folder - Contains the Page Objects & Base Screen for those Page Objects 
Helpers - Contains a helper to set times for various waits 
Extensions - Contains extensions of XCUIApplication, XCUIElementQuery, & XCUIElement to help with 

Each Page Object inherits the ability to check for the existence of all of the bottom nav bar elements(Home, Browse, Notification, Search).

Those are buttons I idenified as critical buttons in the flow so the automation will always check for the presence of those when naviating to a new page.

The Swipe Up Extension I added is also helpful for larger lists and  elements that arent immediately visible.

It also helps to make for the subtle differences that may occur across different real devices & simulators.

I also added other extensions to the code that I have written from my previous roles as an iOS SDET which will be useful as the application scales.

Don't hesitate to reach out with questions on this submission!

