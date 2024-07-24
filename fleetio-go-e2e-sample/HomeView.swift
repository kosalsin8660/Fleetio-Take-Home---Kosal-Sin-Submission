//
//  HomeView.swift
//  fleetio-go-e2e-sample
//
//  Created by Tony Fang on 7/19/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
  
  var body: some View {
    TabView {
      Image("fleetio-logo")
        .tabItem {
          Label("Home", systemImage: "house")
          .accessibilityIdentifier(AccessibilityIdentifiers.HomeView.homeTab)
        }
      BrowseView()
        .tabItem {
          Label("Browse", systemImage: "square.grid.2x2")
          .accessibilityIdentifier(AccessibilityIdentifiers.HomeView.browseTab)
        }
      Text("Notifications")
        .tabItem {
          Label("Notifications", systemImage: "bell.badge.fill")
          .accessibilityIdentifier(AccessibilityIdentifiers.HomeView.notificationsTab)
        }
      Text("Search")
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
          .accessibilityIdentifier(AccessibilityIdentifiers.HomeView.searchTab)
        }
    }
    .navigationBarBackButtonHidden(true)
  }
}

#Preview {
  HomeView()
}
