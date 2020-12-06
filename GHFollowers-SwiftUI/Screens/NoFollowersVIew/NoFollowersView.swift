//
//  NoFollowersView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/6/20.
//

import SwiftUI

struct NoFollowersView: View {
  var body: some View {
    VStack {
      Text("🤣")
        .font(.system(size: 180))
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .frame(width: 200, height: 200)
        .aspectRatio(contentMode: .fit)
        .padding()
      
      Text("You have no followers!")
        .font(.system(size: 45))
        .font(.title2)
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
    }
  }
}

struct NoFollowersView_Previews: PreviewProvider {
  static var previews: some View {
    NoFollowersView()
  }
}
