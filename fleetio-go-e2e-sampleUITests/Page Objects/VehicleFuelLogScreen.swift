//
//  VehicleFuelLogScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class VehicleFuelLogScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    
    private lazy var addNewFuel = app.buttons.matching(identifier: "fuel_log_new_entry").firstMatch
    
    
    func tapAddNewFuelLogButton() -> AddFuelLogScreen {
        XCTAssertTrue(addNewFuel.waitForExistence(timeout: .small))
        addNewFuel.tap()
        return AddFuelLogScreen()
    }
    
    func getFuelEntryCount() -> Int {
        let predicate = NSPredicate(format: "identifier CONTAINS 'fuel_log_list_item'")
        let numFuelEntries = app.buttons.containing(predicate).count
        return numFuelEntries
    }
    
}
