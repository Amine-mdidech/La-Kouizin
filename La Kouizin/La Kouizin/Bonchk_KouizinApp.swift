//
//  Bonchk_KouizinApp.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI
import SwiftData

@main
struct Kouizin: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Recipe.self)
    }
}
