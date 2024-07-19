//
//  ContentView.swift
//  NetworkingTest
//
//  Created by Colin Evans on 2024-07-18.
//

import SwiftUI

struct ContentView: View {
  let viewModel: CatGridViewModel
  
  var body: some View {
    VStack {
      if let errorString = viewModel.errorString {
        Text(errorString)
      } else {
        // we want each row to have at most 4 things
        Grid {
          ForEach(0..<viewModel.getGridRows(), id: \.self) { index in
            GridRow {
              ForEach(viewModel.getRowRange(index), id: \.self) { dataIndex in
                let catData = viewModel.data[dataIndex]
                AsyncImage(url: URL(string: catData.imageURL)!) { result in
                  result.image?
                    .resizable()
                    .scaledToFit()
                }.frame(width: 80, height: 80)
                  
              }
            }
          }
        }
      }
    }.task {
      await viewModel.getCats()
    }
  }
}

#Preview {
  ContentView(viewModel: .preview())
}
