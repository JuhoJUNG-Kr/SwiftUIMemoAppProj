//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

@main
struct MemoAppApp: App {
    @StateObject var manager = MemoManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
