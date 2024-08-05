//
//  fleetio_go_e2e_sampleUITests.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Tony Fang on 7/19/24.
//

import XCTest

final class FleetioGoUITests: FleetioGoUITestsBaseClass {
    
    /*
     numFuelLogElementsInitial: Initial number of Fuel Logs for an existing vehicle
     numFuelLogElementsPostSave: Number of Fuel Logs for an existing vehicle after a new Fuel Log is saved
    */
    var numFuelLogElementsInitial: Int = 0
    var numFuelLogElementsPostSave: Int = 0
    
    
    /*
     inputtedPricePerGallon: Price per gallon inputted into the new Fuel Log form
     actualSavedPricePerGallon: Price per gallon that appears in the saved Fuel Log form
    */
    var inputtedPricePerGallon: String = ""
    var actualSavedPricePerGallon: String = ""
    
    /*
     inputtedGallons: Gallon amount inputted into the new Fuel Log form
     actualSavedGallons: Gallon amount that appears in the saved Fuel Log form
    */
    var inputtedGallons: String = ""
    var actualSavedGallons: String = ""
    
        
    override func setUp() {
        app.launch()
        LoginScreen()
            .verifyLoginFields()
            .login(with: TestUsers.defaultUser)
    }
        
    func testAddNewFuelEntryForExistingVehicle() {
        HomeScreen()
            .verifyHomeImage()
            .tapBrowserTab()
        
        BrowseScreen()
            .verifyVehiclesButton()
            .tapVehicles()
        
        VehiclesScreen()
            .selectVehicleName(vehicleName: "Electric Dream")
        
        VehicleDetailsScreen()
            .tapFuelLog()
        
        numFuelLogElementsInitial = VehicleFuelLogScreen().getFuelEntryElementCount() // Will return something like 1
        
        VehicleFuelLogScreen()
            .tapAddNewFuelLogButton()
        
        AddFuelLogScreen()
            .fillAddNewFuelFields()
        
        inputtedPricePerGallon = AddFuelLogScreen().getCurrentPricePerGallonValue()  // Will return something like 225
        
        inputtedGallons = AddFuelLogScreen().getCurrentGallonValue() // Will return something like 48
        
        AddFuelLogScreen()
            .saveNewFuelEntry()
        
        numFuelLogElementsPostSave = VehicleFuelLogScreen().verifyProperFuelEntryElementCount()
        
        actualSavedPricePerGallon = VehicleFuelLogScreen().getSavedPerGallonValues() // Will return something like $225
        
        actualSavedGallons = VehicleFuelLogScreen().getSavedGallonValues() // Will return something like 48
        
        XCTAssertEqual(numFuelLogElementsPostSave, numFuelLogElementsInitial + 1)
        
        XCTAssertTrue(actualSavedPricePerGallon.hasSuffix(inputtedPricePerGallon))
        
        XCTAssertEqual(inputtedGallons, actualSavedGallons)
    }
    
    func testRequiredFieldsNotFilledNewFuelEntry() {
        HomeScreen()
            .verifyHomeImage()
            .tapBrowserTab()
        
        BrowseScreen()
            .verifyVehiclesButton()
            .tapVehicles()
        
        VehiclesScreen()
            .selectVehicleName(vehicleName: "Electric Dream")
        
        VehicleDetailsScreen()
            .tapFuelLog()
        
        VehicleFuelLogScreen()
            .tapAddNewFuelLogButton()
        
        AddFuelLogScreen()
            .saveNewFuelEntryWithoutFillingRequiredFields()
    }
    
    
    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attach = XCTAttachment(screenshot: screenshot)
        add(attach)
    }
}
