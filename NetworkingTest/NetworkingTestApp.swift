//
//  NetworkingTestApp.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import SwiftUI

@main
struct NetworkingTestApp: App {
  let container = DependencyContainer()
  
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: container.viewModel)
    }
  }
}
