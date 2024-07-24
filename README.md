UI Test Automation using XCUITest Framework on Fleetio Go iOS app

Instructions to Run The XCUITests

1. Clone this repository on your local machine & access the fleetio-go-e2e-sample.xcodeproj project via Xcode
2. Navigate to the fleetio-go-e2e-sampleUITests folder
3. Find the Tests folder and run the FleetioGoUITests file
 

Here is a detailed overview of the contents in the repository. Focus on all the files within the fleetio-go-e2e-sampleUITests folder, those contain all my changes.

Tests Folder  - Contains the main Test Class to run the iOS End to End Tests From

Common Folder - Contains the Base Test Class & the Test Logins 

Page Objects Folder - Contains the Page Objects & Base Screen for those Page Objects 

Helpers - Contains a helper to set times for various waits 

Extensions - Contains extensions of XCUIApplication, XCUIElementQuery, & XCUIElement to help with 

Each Page Object inherits the ability to check for the existence of all of the bottom nav bar elements(Home, Browse, Notification, Search).

Those are buttons I idenified as critical buttons in the flow so the automation will always check for the presence of those when naviating to a new page.

The Swipe Up Extension I added is also helpful for larger lists and  elements that aren't immediately visible.

It also helps to account for the subtle differences that may occur across different real devices & simulators.

I also added other extensions to the code that I have written from my previous roles as an iOS SDET which will be useful as the application scales.

Don't hesitate to reach out with questions on this submission!

