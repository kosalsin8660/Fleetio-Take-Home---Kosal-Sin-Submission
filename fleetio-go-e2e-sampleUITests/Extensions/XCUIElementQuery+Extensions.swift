//
//  XCUIElementQuery+Extensions.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

extension XCUIElementQuery {
    /// Used to determine how a search is performed when looking for an `XCUIElement`
    enum QueryMatchType {
        // NSPredicate will use `label == %@` format.
        case exact
        // NSPredicate will use `label CONTAINS[c] %@` format.
        case fuzzy
    }
    func softMatching(substring: String) -> [XCUIElement] {
        return self.allElementsBoundByIndex.filter { $0.label.contains(substring) }
    }
    /// Searches for all elements matching a given label.
    /// - Parameter label: The string label to match against.
    /// - Parameter matchType: The type of search to perform for the element.
    /// - Returns: The matching `XCUIElementQuery` list, when found.
    func matchElements(_ label: String, matchType: QueryMatchType = .exact) -> XCUIElementQuery {
        return containing(
            NSPredicate(
                format: matchType == .exact ? "label == %@" : "label CONTAINS[c] %@",
                label
            )
        )
    }

}
