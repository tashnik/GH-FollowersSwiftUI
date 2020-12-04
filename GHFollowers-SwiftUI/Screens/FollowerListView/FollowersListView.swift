//
//  FollowersListView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

struct FollowersListView: View {
  
  @Binding var userName: String
  
  let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(MockData.followers) { follower in
          FollowersListColumnView(follower: follower)
        }
      }
    }
    .navigationBarTitle(userName)
  }
}

struct FollowersListView_Previews: PreviewProvider {
  static var previews: some View {
    FollowersListView(userName: .constant("Username"))
  }
}

struct FollowersListColumnView: View {
  
  let follower: Follower
  
  var body: some View {
    VStack {
      Image(systemName: follower.avatarUrl)
        .resizable()
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
