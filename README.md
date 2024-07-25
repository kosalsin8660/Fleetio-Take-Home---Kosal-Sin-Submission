UI Test Automation using XCUITest Framework on Fleetio Go iOS app

Instructions to Run The XCUITests

1. Clone this repository on your local machine & access the fleetio-go-e2e-sample.xcodeproj project via Xcode
2. Navigate to the fleetio-go-e2e-sampleUITests folder
3. Find the Tests folder & run the FleetioGoUITests test class to execute the iOS XCUITests! A screenshot of where you should be at Step 3 is provided below.

<img width="1667" alt="Screenshot 2024-07-25 at 9 35 14 AM" src="https://github.com/user-attachments/assets/797fea8b-28a3-4f63-a6c9-29d7c48e4a56">

Click on the diamond symbol on Line 10 to run the XCUITests!

Here is a detailed overview of the contents in the repository. Focus on all the files within the fleetio-go-e2e-sampleUITests folder, those contain the majority of my code.

Subfolders within the fleetio-go-e2e-sampleUITests folder...

Tests Folder  - Contains the main Test Class to run the iOS UI Tests From

Common Folder - Contains the Base Test Class & the Test Logins 

Page Objects Folder - Contains the Page Objects & Base Screen for those Page Objects. I put some useful helper methods into the Base Screen which makes those accessible across all Page Objects.

Helpers - Contains a helper to set times for various waits 

Extensions - Contains extensions of XCUIApplication, XCUIElementQuery, & XCUIElement to help with test stability & readability as the application scales 

Each Page Object inherits the ability to check for the existence of all of the bottom nav bar elements(Home, Browse, Notification, Search).

Those are buttons I identified as critical buttons in the app so the automation code will always check for the presence of those when navigating to a new page & fail if any aren't present.

The Swipe Up Extension I added is also helpful for larger lists & elements that aren't immediately visible.

It helps to account for the subtle differences that may occur across different real devices & simulators, rather than using a generic swipe up.

I also added other extensions to the code that I have written from my previous roles as an iOS SDET which will be useful in combating flakiness as the application scales.

Don't hesitate to reach out with questions on this submission!

