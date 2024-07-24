//
//  SearchBar.swift
//  fleetio-go-e2e-sample
//
//  Created by Tony Fang on 7/19/24.
//

import SwiftUI

struct SearchBar: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      TextField("Search", text: $text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .accessibilityIdentifier(AccessibilityIdentifiers.SearchBar.searchTextField)
    }
    .padding()
  }
}
