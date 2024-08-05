//
//  Login Screen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import XCTest

class LoginScreen: BaseScreen {
    
    // Could move lazy vars & verifyLoginFields methods into a verify() method inherited from BaseScreen
    // verify() method would take an array of XCUIElements as arguments then do asserts for existence of each of the elements
    // This verify() method would be located in the LoginScreen override constructor along with the verifyNavElements() method
    
    // Could also add an invalid login method to test negative test cases
    
    private lazy var usernameField = app.textFields["email_text_field"]
    private lazy var passwordField = app.secureTextFields["password_text_field"]
    private lazy var loginButton = app.buttons["login_button"]

    
    func verifyLoginFields() -> LoginScreen {
        XCTAssertTrue(usernameField.waitForExistence(timeout: .small))
        XCTAssertTrue(passwordField.waitForExistence(timeout: .small))
        XCTAssertTrue(loginButton.waitForExistence(timeout: .small))
        return self
    }
    
    @discardableResult
    func login(with testUser: TestUsers) -> HomeScreen {
        let userName = testUser.userFields.username
        let password = testUser.userFields.password
        
        usernameField.tap()
        usernameField.typeText(userName)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        loginButton.tap()
        
        return HomeScreen()
    }
}
