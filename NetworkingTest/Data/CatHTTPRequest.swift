//
//  CatHTTPRequest.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

struct CatHTTPRequest: HTTPRequest {
  typealias HTTPRespone = [CatResult]
  
  var baseURL: URL
  var method: HTTPRequestType
  var headers: [String : String]
  var parameters: [String : String]
}
