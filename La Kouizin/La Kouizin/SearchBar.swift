//
//  SearchBar.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search recipes...", text: $text)
        }
    }
}
