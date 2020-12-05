//
//  FollowersListView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

struct FollowersListView: View {
  
  @Binding var username: String
  @StateObject var viewModel = FollowerListViewModel()
  
  let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    ZStack {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(viewModel.followers) { follower in
            FollowersListColumnView(follower: follower)
              .onTapGesture {
                viewModel.isShowingDetailView = true
              }
          }
        }
      }
      if viewModel.isLoading {
        LoadingView()
      }
    }
    .navigationBarTitle(username)
    .onAppear {
      viewModel.getFollowers(username: username, page: 1)
    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    }
    .sheet(isPresented: $viewModel.isShowingDetailView, content: {
      FollowerDetailView()
    })
  }
}


struct FollowersListView_Previews: PreviewProvider {
  static var previews: some View {
    FollowersListView(username: .constant("Username"))
  }
}

// MARK: Column View
struct FollowersListColumnView: View {
  
  let follower: Follower
  
  var body: some View {
    VStack {
      FollowerRemoteImage(urlString: follower.avatarUrl)
        .aspectRatio(contentMode: .fit)
        .frame(width: 90, height: 90)
      Text(follower.login)
        .fontWeight(.semibold)
        .font(.title2)
        .multilineTextAlignment(.center)
        .scaledToFit()
        .minimumScaleFactor(0.6)
    }
    .padding()
  }
}
