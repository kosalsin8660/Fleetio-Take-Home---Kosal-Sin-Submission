//
//  fleetio_go_e2e_sampleUITests.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Tony Fang on 7/19/24.
//

import XCTest

final class FleetioGoUITests: FleetioGoUITestsBaseClass {
    
    var homeScreen: HomeScreen!
    var browseScreen: BrowseScreen!
    var vehiclesScreen: VehiclesScreen!
    var vehicleDetailsScreen: VehicleDetailsScreen!
    var vehicleFuelLogScreen: VehicleFuelLogScreen!
    var addFuelLogScreen: AddFuelLogScreen!
    
    var numFuelElementsInitial: Int = 0
    var numFuelElementsPostSave: Int = 0
    
    var inputtedPricePerGallon: String = ""
    var actualSavedPricePerGallon: String = ""
    
    var inputtedGallons: String = ""
    var actualSavedGallons: String = ""
    
        
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        LoginScreen().verifyLoginFields()
        homeScreen = LoginScreen().login()
    }
        
    func testAddNewFuelEntryForExistingVehicle() {
        homeScreen.verifyHomeImage()
        
        browseScreen = homeScreen.tapBrowserTab()
        
        browseScreen.verifyVehiclesButton()
        
        vehiclesScreen = browseScreen.tapVehicles()
        
        vehicleDetailsScreen = vehiclesScreen.selectVehicleName(vehicleName: "Electric Dream")
        
        vehicleFuelLogScreen = vehicleDetailsScreen.tapFuelLog()
        
        numFuelElementsInitial = vehicleFuelLogScreen.verifyProperFuelEntryElementCount()
        
        addFuelLogScreen = vehicleFuelLogScreen.tapAddNewFuelLogButton()
        
        addFuelLogScreen = addFuelLogScreen.fillAddNewFuelFields()
        
        inputtedPricePerGallon = addFuelLogScreen.getCurrentPricePerGallonValue()
        
        inputtedGallons = addFuelLogScreen.getCurrentGallonValue()
        
        vehicleFuelLogScreen = addFuelLogScreen.saveNewFuelEntry()
        
        numFuelElementsPostSave = vehicleFuelLogScreen.verifyProperFuelEntryElementCount()
        
        actualSavedPricePerGallon = vehicleFuelLogScreen.getSavedPerGallonValues()
        
        actualSavedGallons = vehicleFuelLogScreen.getSavedGallonValues()
        
        XCTAssertEqual(numFuelElementsPostSave, numFuelElementsInitial + 1)
        
        XCTAssertTrue(actualSavedPricePerGallon.hasSuffix(inputtedPricePerGallon))
        
        XCTAssertEqual(inputtedGallons, actualSavedGallons)
    }
    
    func testRequiredFieldsNotFilledNewFuelEntry() {
        homeScreen.verifyHomeImage()
        
        browseScreen = homeScreen.tapBrowserTab()
        
        browseScreen.verifyVehiclesButton()
        
        vehiclesScreen = browseScreen.tapVehicles()
        
        vehicleDetailsScreen = vehiclesScreen.selectVehicleName(vehicleName: "Electric Dream")
        
        vehicleFuelLogScreen = vehicleDetailsScreen.tapFuelLog()
        
        addFuelLogScreen = vehicleFuelLogScreen.tapAddNewFuelLogButton()
        
        addFuelLogScreen.saveNewFuelEntryWithoutFillingRequiredFields()
        
    }
    
    
    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attach = XCTAttachment(screenshot: screenshot)
        add(attach)
    }
}
