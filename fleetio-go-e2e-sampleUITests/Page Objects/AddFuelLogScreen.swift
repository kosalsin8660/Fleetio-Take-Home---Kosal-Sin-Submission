//
//  AddFuelLogScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

class AddFuelLogScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    
    
    private lazy var pricePerGallon = app.textFields.matching(identifier: "fuel_log_price_per_gallon").firstMatch
    private lazy var gallons = app.textFields.matching(identifier: "fuel_log_gallons").firstMatch
    private lazy var total = app.textFields.matching(identifier: "fuel_log_total_cost").firstMatch
    private lazy var tripMiles = app.textFields.matching(identifier: "fuel_log_total_milage").firstMatch
    private lazy var odoMeter = app.textFields.matching(identifier: "fuel_log_odometer").firstMatch
    private lazy var fuelTypeButton = app.buttons.matching(identifier: "Fuel Type, *").firstMatch
    
    private lazy var requiredFieldsError = app.staticTexts.matching(identifier: "validation_message").firstMatch
    
    func fillAddNewFuelFields() -> AddFuelLogScreen {
    
        XCTAssertTrue(pricePerGallon.waitForExistence(timeout: .small))
        XCTAssertTrue(gallons.waitForExistence(timeout: .small))
        XCTAssertTrue(tripMiles.waitForExistence(timeout: .small))
        XCTAssertTrue(tripMiles.waitForExistence(timeout: .small))
        XCTAssertTrue(odoMeter.waitForExistence(timeout: .small))
        
        let numericNewFuelLogInputs: [XCUIElement]  = [pricePerGallon, gallons,tripMiles, odoMeter]
        
        for element in numericNewFuelLogInputs {
            let randomNumber = Int.random(in: 25..<1000)
            app.swipeUp(untilHittable: element)
            element.tap()
            element.typeText(String(randomNumber))
        }
        
          return tapGasTypeField().selectAndSaveGasType(gasType: "Flex Fuel")
  }
    

    func saveNewFuelEntry() -> VehicleFuelLogScreen {
        XCTAssertTrue(saveButton.waitForExistence(timeout: .small))
        saveButton.tap()
        XCTAssertFalse(requiredFieldsError.waitForExistence(timeout: .small))
        return VehicleFuelLogScreen()
    }
    
    func saveNewFuelEntryWithoutFillingRequiredFields() {
        XCTAssertTrue(saveButton.waitForExistence(timeout: .small))
        saveButton.tap()
        XCTAssertTrue(requiredFieldsError.waitForExistence(timeout: .small))
    }
    
    
    func tapGasTypeField() -> SelectFuelTypeForNewFuelLogScreen {
        XCTAssertTrue(fuelTypeButton.waitForExistence(timeout: .small))
        fuelTypeButton.tap()
        return SelectFuelTypeForNewFuelLogScreen()
    }
    
}
