//
//  FollowerListView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

struct FavoritesListView: View {
  
  var body: some View {
    NavigationView {
      Text("Favorites list")
        .navigationBarTitle("Favorites")
    }
  }
}

struct FollowerListView_Previews: PreviewProvider {
  static var previews: some View {
    FavoritesListView()
  }
}
