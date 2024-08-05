//
//  VehicleDetailScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class VehicleDetailsScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    
    private lazy var fuelLogButton = app.buttons["vehicle_option_Fuel Log"]
    
    @discardableResult
    func tapFuelLog() -> VehicleFuelLogScreen {
        XCTAssertTrue(fuelLogButton.waitForExistence(timeout: .small))
        fuelLogButton.tap()
        return VehicleFuelLogScreen()
    }
    
}
