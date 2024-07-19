//
//  APIKeyProvider.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

enum APIKeyStorage {
  case internalStorage // Not recommended
}

@propertyWrapper
struct APIKeyProvider {
  private var storageMethod: APIKeyStorage

  init(storageMethod: APIKeyStorage) {
    self.storageMethod = storageMethod
  }

  var wrappedValue: String {
    get { getAPIKey() }
  }
  
  private func getAPIKey() -> String {
    switch storageMethod {
    case .internalStorage:
      return (Bundle.main.infoDictionary?["APIKEY"] as? String) ?? ""
    }
  }
}
