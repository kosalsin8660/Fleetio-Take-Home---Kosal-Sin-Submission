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
    func selectVehicleName(vehicleName: String) -> VehicleDetailsScreen {
        let vehicleToSelect = app.buttons.softMatching(substring: vehicleName).first!
        XCTAssertTrue(vehicleToSelect.waitForExistence(timeout: .medium))
        vehicleToSelect.tap()
        return VehicleDetailsScreen()
    }
}

