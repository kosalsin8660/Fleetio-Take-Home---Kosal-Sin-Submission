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
    
    
    private lazy var pricePerGallon = app.textFields["fuel_log_price_per_gallon"]
    private lazy var gallons = app.textFields["fuel_log_gallons"]
    private lazy var total = app.textFields["fuel_log_total_cost"]
    private lazy var tripMiles = app.textFields["fuel_log_total_milage"]
    private lazy var odoMeter = app.textFields["fuel_log_odometer"]
    private lazy var fuelTypeButton = app.buttons["Fuel Type, *"]
    
    private lazy var requiredFieldsError = app.staticTexts["validation_message"]
    
    private lazy var pricePerGallonAmount = pricePerGallon.value
    private lazy var gallonsAmount = gallons.value
    
    @discardableResult
    func fillAddNewFuelFields() -> AddFuelLogScreen {
    
        XCTAssertTrue(pricePerGallon.waitForExistence(timeout: .small))
        XCTAssertTrue(gallons.waitForExistence(timeout: .small))
        XCTAssertTrue(tripMiles.waitForExistence(timeout: .small))
        XCTAssertTrue(tripMiles.waitForExistence(timeout: .small))
        XCTAssertTrue(odoMeter.waitForExistence(timeout: .small))
        
        let numericNewFuelLogInputs: [XCUIElement] = [pricePerGallon, gallons,tripMiles, odoMeter]
        
        for element in numericNewFuelLogInputs {
            let randomNumber = Int.random(in: 25..<1000)
            app.swipeUp(untilHittable: element)
            element.tap()
            element.typeText(String(randomNumber))
        }
        
          return tapGasTypeField().selectAndSaveGasType(gasType: "Flex Fuel")
  }

    func getCurrentPricePerGallonValue() -> String {
        guard pricePerGallonAmount != nil else {
            return ""
        }
        
        return toString(pricePerGallonAmount)
    }
    
    func getCurrentGallonValue() -> String {
        guard gallonsAmount != nil else {
            return ""
        }
        return toString(gallonsAmount)
    }
    
    @discardableResult
    func saveNewFuelEntry() -> VehicleFuelLogScreen {
        XCTAssertTrue(saveButton.waitForExistence(timeout: .small))
        saveButton.tap()
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
