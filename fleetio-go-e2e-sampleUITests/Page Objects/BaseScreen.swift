//
//  BaseScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//
import XCTest

class BaseScreen {
    let app: XCUIApplication
    let homeButton: XCUIElement
    
    let browseButton: XCUIElement
    let notificationsButton: XCUIElement
    
    let searchButton: XCUIElement
    let doneButton: XCUIElement
    let saveButton: XCUIElement
    
    init() {
        self.app = XCUIApplication()
        self.homeButton = app.buttons.matching(identifier: "home_tab").firstMatch
        self.browseButton = app.buttons.matching(identifier: "browse_tab").firstMatch
        self.notificationsButton = app.buttons.matching(identifier: "notifications_tab").firstMatch
        self.searchButton = app.buttons.matching(identifier: "search_tab").firstMatch
        self.doneButton = app.buttons.matching(identifier: "Done").firstMatch
        self.saveButton = app.buttons.matching(identifier: "Save").firstMatch
    }
    
    func verifyNavElements() {
        XCTAssertTrue(self.homeButton.waitForExistence(timeout: .small))
        XCTAssertTrue(self.browseButton.waitForExistence(timeout: .small))
        XCTAssertTrue(self.notificationsButton.waitForExistence(timeout: .small))
        XCTAssertTrue(self.searchButton.waitForExistence(timeout: .small))
    }
    
    func dismissKeyboardIfPresent() {
        let keyboard = app.children(matching: .window).firstMatch
        XCTAssertTrue(keyboard.waitForExistence(timeout: .medium))
        keyboard.tap()
    }
}
