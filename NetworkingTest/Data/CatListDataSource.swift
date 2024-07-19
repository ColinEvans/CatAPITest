//
//  CatListDataSource.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

protocol CatListDataSourceProviding {
  func getCatListData() async throws -> [CatResult]
}

struct CatListDataSource: CatListDataSourceProviding {
  private let client: HTTPClient
  private let key: APIKeyProvider
  private let baseURL: URL
  
  init(client: HTTPClient,
       baseURL: URL,
       key: APIKeyProvider
  ) {
    self.client = client
    self.baseURL = baseURL
    self.key = key
  }
  
  func getCatListData() async throws -> [CatResult] {
    let request = makeRequest()
    let results = try await client.request(for: request)

    return results
  }
  
  // This is in a separate function since we may need to update the URL for pagination
  func makeRequest() -> CatHTTPRequest {
    CatHTTPRequest(
      baseURL: baseURL,
      method: .GET,
      headers: ["x-api-key": key.wrappedValue],
      parameters: [:]
    )
  }
}
