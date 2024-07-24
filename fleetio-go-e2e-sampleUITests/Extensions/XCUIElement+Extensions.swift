//
//  XCUIElement+Extensions.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/22/24.
//

import Foundation
import XCTest

extension XCUIElement {
    
    @discardableResult
    func waitForExistence(timeout: Timeout) -> Bool {
        return waitForExistence(timeout: timeout.rawValue)
    }
    
    func waitUntilExists(timeout: TimeInterval = 600, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        let elementExists = waitForExistence(timeout: timeout)
        if elementExists {
            return self
        } else {
            XCTFail("Could not find \(self) before timeout", file: file, line: line)
        }
            
        return self
    }
    
    func waitForNonExistence(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "exists == FALSE")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
        return !exists
    }
}

