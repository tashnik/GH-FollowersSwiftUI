//
//  Alert.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/5/20.
//

import SwiftUI

struct AlertItem: Identifiable {
  
  let id = UUID()
  let title: Text
  let message: Text
  let dismissButton: Alert.Button
}

struct AlertContext {
  
  static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data recieved from the server was invalid.  Please contact support."), dismissButton: .default(Text("Ok")))
  
  static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server.  User does not exist"), dismissButton: .default(Text("Ok")))
  
  static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server.  If this issue persists, please contact support"), dismissButton: .default(Text("Ok")))
  
  static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time.  Please check your internet connection"), dismissButton: .default(Text("Ok")))
}

