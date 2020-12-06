//
//  FollowersListViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/5/20.
//

import SwiftUI

final class FollowerListViewModel: ObservableObject {
  
  @Published var followers: [Follower] = []
  @Published var alertItem: AlertItem?
  @Published var isLoading = false
  @Published var isShowingDetailView = false
  @Published var hasMoreFollowers = true
  @Published var page = 1
  @Published var hasNoFollowers = false
  @Published var searchText = ""
  
  func getFollowers(username: String, page: Int) {
    isLoading = true
    NetworkManager.shared.getFollowers(for: username, page: page) { [self] result in
      DispatchQueue.main.async {
        isLoading = false
        
        switch result {
        
        case .success(let followers):
          if followers.count < 100 { hasMoreFollowers = false }
          self.followers.append(contentsOf: followers)
          
          if self.followers.isEmpty {
            hasNoFollowers = true
          }
        case .failure(let error):
          switch error {
          
          case .invalidURL:
            alertItem = AlertContext.invalidURL
          case .invalidResponse:
            alertItem = AlertContext.invalidResponse
          case .invalidData:
            alertItem = AlertContext.invalidData
          case .unableToComplete:
            alertItem = AlertContext.unableToComplete
          }
        }
      }
    }
  }
}
