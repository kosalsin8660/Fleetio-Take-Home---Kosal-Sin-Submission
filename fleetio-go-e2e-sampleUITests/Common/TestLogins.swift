//
//  TestLogins.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Kosal Sin on 7/22/24.
//


import Foundation

// Initial Implementation - Hard Code 
//public struct TestLogins {
//    
//    enum DefaultLogin {
//        static let username = "Sdetcandidate"
//        static let password = "123"
//    }
//}

// New implementation to support multiple test users
public enum TestUsers {
    case defaultUser
    case wontWorkUser

    var userFields: TestUser {
        switch self {
        case .defaultUser:
            return TestUser("Sdetcandidate", "123")
        case .wontWorkUser:
            return TestUser("Sdet", "123")
        }
    }
}

class TestUser {
    let username: String
    let password: String


    init(_ username: String, _ password: String) {
        self.username = username
        self.password = password
    }
}
