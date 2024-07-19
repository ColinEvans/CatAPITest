//
//  HTTPClient.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

struct HTTPClient {
  private let transport: URLSession
  private let jsonDecoder: JSONDecoder
  
  init(transport: URLSession = URLSession.shared,
       jsonDecoder: JSONDecoder = JSONDecoder()) {
    self.transport = transport
    self.jsonDecoder = jsonDecoder
  }
  
  func request<Request: HTTPRequest>(
    for request: Request,
    validStatus: ClosedRange<Int> = (200...299)
  ) async throws -> Request.HTTPRespone {
    var urlRequest = URLRequest(url: request.baseURL)
    urlRequest.allHTTPHeaderFields = request.headers
    
    let (result, response) = try await transport.data(for: urlRequest)
    
    guard let httpCode = response as? HTTPURLResponse,
          validStatus.contains(httpCode.statusCode) else {
      throw URLError(.cannotConnectToHost)
    }
    
    return try jsonDecoder.decode(Request.HTTPRespone.self, from: result)
  }
}
