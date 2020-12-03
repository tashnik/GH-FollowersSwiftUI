//
//  SearchViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import Foundation

final class SearchViewModel: ObservableObject {
  
  @Published var username: String = ""
  @Published var showAlert: Bool = false
}
