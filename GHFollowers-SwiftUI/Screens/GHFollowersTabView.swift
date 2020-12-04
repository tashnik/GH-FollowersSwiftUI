//
//  GHFollowersTabView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

struct GHFollowersTabView: View {
  
    var body: some View {
      TabView {
        SearchView(viewModel: SearchViewModel())
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Search")
          }
          
        FavoritesListView()
          .tabItem {
            Image(systemName: "star.fill")
            Text("Favorites")
          }
      }
      .accentColor(Color(.systemGreen))
    }
}

struct GHFollowersTabView_Previews: PreviewProvider {
    static var previews: some View {
        GHFollowersTabView()
    }
}
