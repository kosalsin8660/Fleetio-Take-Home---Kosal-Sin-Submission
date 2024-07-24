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
    

    private lazy var browseListItemVehicles = app.buttons.matching(identifier: "browse_list_item_Vehicles").firstMatch
    
    func verifyVehiclesButton() {
        XCTAssertTrue(browseListItemVehicles.waitForExistence(timeout: .small))
    }
    
    func tapVehicles() -> VehiclesScreen {
        browseListItemVehicles.tap()
        return VehiclesScreen()
    }
    
}
