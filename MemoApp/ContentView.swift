//
//  ContentView.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                MemoView()
                    .tabItem {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.secondary)
                        Text("first")
                    }
            }
            .navigationTitle("Memo")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
