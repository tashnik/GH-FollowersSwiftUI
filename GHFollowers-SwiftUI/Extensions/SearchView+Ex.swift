//
//  SearchView+Ex.swift
//  GHFollowers-SwiftUI
//
//  Created by Tashnik on 12/3/20.
//

import SwiftUI

#if canImport(UIKit)
extension SearchView {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
