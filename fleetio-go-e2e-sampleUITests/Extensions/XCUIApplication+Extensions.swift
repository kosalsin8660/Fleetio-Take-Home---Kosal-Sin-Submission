//
//  XCUIApplication+Extensions.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/23/24.
//

import Foundation
import XCTest

extension XCUIApplication {
    
    // Useful swipe up extension for pages with long lists, where the element may initially not be hittable
    @discardableResult func swipeUp(untilHittable element: XCUIElement, maxNumSwipes: Int = 10, swipeVelocity: XCUIGestureVelocity = 1500) -> Bool {
        if element.isHittable {
                return true
        } else {
            var swipeCount = 0
            while !element.isHittable && swipeCount < maxNumSwipes {
                swipeUp(velocity: swipeVelocity)
                swipeCount += 1
                if element.isHittable {
                    return true
                }
            }
                return element.isHittable
            }
    }
}
