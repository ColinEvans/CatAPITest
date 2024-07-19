//
//  CatListDataSourceMock.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation

struct CatListDataSourceMock: CatListDataSourceProviding {
  func getCatListData() async throws -> [CatResult] {
    []
  }
}
