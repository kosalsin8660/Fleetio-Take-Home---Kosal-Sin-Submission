//
//  BrowseScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class BrowseScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    

    private lazy var browseListItemVehicles = app.buttons["browse_list_item_Vehicles"]
    
    func verifyVehiclesButton() -> BrowseScreen {
        XCTAssertTrue(browseListItemVehicles.waitForExistence(timeout: .small))
        return self
    }
    
    @discardableResult
    func tapVehicles() -> VehiclesScreen {
        browseListItemVehicles.tap()
        return VehiclesScreen()
    }
    
}
