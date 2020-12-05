//
//  SearchViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
  
  @Published var username: String = ""
  @Published var showAlert: Bool = false
  @Published var selection: Int? = nil
}
