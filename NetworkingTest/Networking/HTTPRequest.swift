//
//  HTTPRequest.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

protocol HTTPRequest {
  associatedtype HTTPRespone: Decodable
  
  var baseURL: URL { get }
  var method: HTTPRequestType { get }

  var headers: [String: String] { get }
  var parameters: [String: String] { get }
}
