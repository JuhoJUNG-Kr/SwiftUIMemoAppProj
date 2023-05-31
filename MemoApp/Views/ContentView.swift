//
//  ContentView.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: MemoManager
    
    var body: some View {
        NavigationView {
            TabView {
                List {
                    ForEach(manager.memoList) { memo in
                        NavigationLink {
                            DetailView()
                        } label: {
                            MemoView(memo: memo)
                        }

                    }
                }
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
        ContentView().environmentObject(MemoManager())
    }
}
