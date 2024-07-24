//
//  Login Screen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class LoginScreen: BaseScreen {
    private lazy var usernameField = app.textFields.matching(identifier: "email_text_field").firstMatch
    private lazy var passwordField = app.secureTextFields.matching(identifier: "password_text_field").firstMatch
    private lazy var loginButton = app.buttons.matching(identifier: "login_button").firstMatch
    
    func verifyLoginFields() {
        XCTAssertTrue(usernameField.waitForExistence(timeout: .small))
        XCTAssertTrue(passwordField.waitForExistence(timeout: .small))
        XCTAssertTrue(loginButton.waitForExistence(timeout: .small))
    }
    
    func login() -> HomeScreen {
        usernameField.tap()
        usernameField.typeText(TestLogins.DefaultLogin.username)
        
        passwordField.tap()
        passwordField.typeText(TestLogins.DefaultLogin.password)
        
        loginButton.tap()
        
        return HomeScreen()
    }

}
