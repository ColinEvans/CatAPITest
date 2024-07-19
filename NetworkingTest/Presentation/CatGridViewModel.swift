//
//  CatGridViewModel.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import Foundation
import Observation

@Observable class CatGridViewModel {
  var data = [CatResult]()
  var errorString: String?
  
  // The amount of content in each row
  private var rowAmount = 4

  private let dataSource: CatListDataSourceProviding
  
  init(catListDataSource: some CatListDataSourceProviding) {
    self.dataSource = catListDataSource
  }
  
  // For now we don't care about pagination, but it's
  // worth considering for an actual implementation
  func getCats() async {
    do {
      let fetchedData = try await dataSource.getCatListData()
      data = fetchedData
    } catch let error {
      errorString = error.localizedDescription
    }
  }
  
  func getGridRows() -> Int {
    return (data.count / rowAmount) + 1
  }
  
  func getRowRange(_ offset: Int) -> Range<Int> {
    let start = (offset * rowAmount)
    let endPoint = start + rowAmount > data.count ? data.count : start + rowAmount
    
    return (start..<endPoint)
  }
}

extension CatGridViewModel {
  static func preview() -> CatGridViewModel {
    return CatGridViewModel(catListDataSource: CatListDataSourceMock())
  }
}
