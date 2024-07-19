//
//  DependencyContainer.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

struct DependencyContainer {
  private let client = HTTPClient()
  private let catListDataSource: CatListDataSourceProviding
  private let keyProvider = APIKeyProvider(storageMethod: .internalStorage)
  let viewModel: CatGridViewModel
  
  init() {
    catListDataSource = CatListDataSource(client: client, baseURL: URLs.baseURL, key: keyProvider)
    viewModel = CatGridViewModel(catListDataSource: catListDataSource)
  }
}
