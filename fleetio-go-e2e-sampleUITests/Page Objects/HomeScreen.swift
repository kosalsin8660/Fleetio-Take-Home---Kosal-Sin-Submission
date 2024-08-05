//
//  Home Screen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class HomeScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    
    private lazy var homeImage = app.images["house.fill"]
    
    func verifyHomeImage() -> HomeScreen {
        XCTAssertTrue(homeImage.waitForExistence(timeout: .small))
        return self
    }
    
    @discardableResult
    func tapBrowserTab() -> BrowseScreen  {
        browseButton.tap()
        return BrowseScreen()
    }
}
