//
//  SearchView.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

struct SearchView: View {
  
  @StateObject private var viewModel = SearchViewModel()
  
    var body: some View {
      NavigationView {
        VStack(spacing: 23) {
          Image("gh-logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .padding(.vertical)
          
          TextField("Enter a username", text: $viewModel.username)
            .font(.title2)
            .multilineTextAlignment(.center)
            .frame(width: 260, height: 50)
            .foregroundColor(.secondary)
            .background(Color(.tertiarySystemBackground))
            .textFieldStyle(PlainTextFieldStyle())
            .minimumScaleFactor(0.2)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
          
          Spacer()
          
          Button {
            if viewModel.username != "" {
              print("Thank you, \(viewModel.username)")
            } else {
              viewModel.showAlert = true
            }
          } label: {
            Text("Get Followers")
              .font(.headline)
              .frame(width: 260, height: 50)
              .foregroundColor(.white)
              .background(Color(.systemGreen))
              .cornerRadius(10)
              .padding(.bottom, 40)
          }
        }
      }
      .alert(isPresented: $viewModel.showAlert, content: {
        Alert(title: Text("Empty username"), message: Text("Please enter username"), dismissButton: .default(Text("Ok")))
      })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
      SearchView()
    }
}
