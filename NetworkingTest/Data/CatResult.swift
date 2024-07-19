//
//  CatResult.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

struct CatResult: Codable, Identifiable {
  enum CodingKeys: String, CodingKey {
    case id
    case url
    case width
    case height
  }
  
  let id: String
  let imageURL: String
  let width: Int
  let height: Int
  
  // MARK: - Decoder
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
    imageURL = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    width = try container.decodeIfPresent(Int.self, forKey: .width) ?? 0
    height = try container.decodeIfPresent(Int.self, forKey: .width) ?? 0
  }
  
  // MARK: - Encoder
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(imageURL, forKey: .url)
    try container.encode(width, forKey: .width)
    try container.encode(height, forKey: .height)
  }
}
