//
//  VehiclesScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class VehiclesScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    
    @discardableResult
    func selectVehicleName(vehicleName: String) -> VehicleDetailsScreen {
        guard let vehicleToSelect = app.buttons.softMatchingLabel(substring: vehicleName).first else {
            XCTFail("Vehicle was not found")
            return VehicleDetailsScreen()
        }
        
        XCTAssertTrue(vehicleToSelect.waitForExistence(timeout: .small))
        app.swipeUp(untilHittable: vehicleToSelect)
        vehicleToSelect.tap()
        
        return VehicleDetailsScreen()
    }
}

