//
//  SelectFuelTypeForNewFuelLogScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//


import Foundation
import XCTest

class SelectFuelTypeForNewFuelLogScreen: BaseScreen {
    override init() {
        super.init()
        self.verifyNavElements()
    }
    
    private lazy var flexFuel = app.staticTexts.matching(identifier: "Flex Fuel").firstMatch
    
    func selectAndSaveGasType(gasType: String) -> AddFuelLogScreen {
        app.swipeUp(untilHittable: flexFuel)
        XCTAssertTrue(flexFuel.waitForExistence(timeout: .small))
        flexFuel.tap()
        XCTAssertTrue(doneButton.waitForExistence(timeout: .small))
        doneButton.tap()
        return AddFuelLogScreen()
    }
}
