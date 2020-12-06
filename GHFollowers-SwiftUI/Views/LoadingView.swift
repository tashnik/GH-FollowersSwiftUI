//
//  LoadingView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/5/20.
//

import SwiftUI

struct LoadingView: View {
  var body: some View {
    ZStack {
      Color(.systemBackground)
        .edgesIgnoringSafeArea(.all)
      
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: Color(.systemGreen)))
        .scaleEffect(2)
    }
  }
}


