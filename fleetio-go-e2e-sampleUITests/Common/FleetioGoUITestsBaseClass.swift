//
//  FleetIoBaseClass.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/22/24.
//

import XCTest

class FleetioGoUITestsBaseClass: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
