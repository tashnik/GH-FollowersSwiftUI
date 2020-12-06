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
  @State var followerCount = 0
  
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
              .onAppear {
                followerCount += 1
                print(followerCount)
                
                if followerCount == 100 {
                  guard viewModel.hasMoreFollowers else { return }
                  followerCount = 0
                  viewModel.page += 1
                  viewModel.getFollowers(username: username, page: viewModel.page)
                }
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
      viewModel.getFollowers(username: username, page: viewModel.page)
    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    }
    .sheet(isPresented: $viewModel.isShowingDetailView, content: {
      FollowerDetailView()
    })
    .sheet(isPresented: $viewModel.hasNoFollowers, content: {
      NoFollowersView()
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
