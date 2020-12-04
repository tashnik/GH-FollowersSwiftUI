//
//  Follower.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import Foundation

struct Follower: Codable, Hashable, Identifiable {
  let id = UUID()
  var login: String
  var avatarUrl: String
}

struct MockData {
  
  static let follower = Follower(login: "Dave", avatarUrl: "person.circle")
  
  static let followers = [Follower(login: "Dave", avatarUrl: "person.circle"),
                          Follower(login: "Todd", avatarUrl: "person"),
                          Follower(login: "Steve", avatarUrl: "person.circle"),
                          Follower(login: "Peter", avatarUrl: "person"),
                          Follower(login: "Mary-Jane", avatarUrl: "person.circle"),
                          Follower(login: "Conan", avatarUrl: "person")]
}
