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
    private lazy var allFuelElements = app.buttons.softMatchingIdentifier(substring: "fuel_log_list_item")
    private lazy var topFuelElement = app.buttons.softMatchingIdentifier(substring: "fuel_log_list_item").first!
    
    func tapAddNewFuelLogButton() -> AddFuelLogScreen {
        XCTAssertTrue(addNewFuel.waitForExistence(timeout: .small))
        addNewFuel.tap()
        return AddFuelLogScreen()
    }
    
    // Returns a count of fuel elements on each call
    // Verfies that the most recently addded Fuel Element has all the fields by verifying the number of statictexts which is 14
    func verifyProperFuelEntryElementCount() -> Int {
        XCTAssertTrue(topFuelElement.waitForExistence(timeout: .small))
        let numFuelElementsValueFields = topFuelElement.staticTexts.count
        let numAllFuelElements = allFuelElements.count
        XCTAssertEqual(numFuelElementsValueFields, 14)
        return numAllFuelElements
    }
    
    
    // Only did the Per Gallon and Gallon Values for the sake of time but I would make methods for all the other fields as well
    // Additionally, I would "DRY UP" these methods after implementation into helper methods and/or extensions
    // The below methods gets the values that were saved for Per Gallon & Gallon & asserts to make sure they are as expected
    
    func getSavedPerGallonValues() -> String {
        XCTAssertTrue(topFuelElement.waitForExistence(timeout: .small))
        let perGallonElement = topFuelElement.staticTexts.element(boundBy: 8)
        let perGallonElementValue = perGallonElement.label
        
        let perGallonSecondElement = topFuelElement.staticTexts.element(boundBy: 9)
        let perGallonSecondElementAsString = toString(perGallonSecondElement.label)
        XCTAssertEqual(perGallonSecondElementAsString, "/gal")
        return toString(perGallonElementValue)
    }
    
    func getSavedGallonValues() -> String {
        let gallonElement = topFuelElement.staticTexts.element(boundBy: 2)
        let gallonElementValue = gallonElement.label
        let gallonSecondElement = topFuelElement.staticTexts.element(boundBy: 3)
        let gallonSecondElementElementAsString = toString(gallonSecondElement.label)
        XCTAssertEqual(gallonSecondElementElementAsString, "gal")
        return toString(gallonElementValue)
    }
}
