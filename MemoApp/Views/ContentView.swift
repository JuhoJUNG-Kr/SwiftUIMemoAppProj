//
//  ContentView.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: MemoManager
    @State private var isPressedPlusButton = false
    
    var body: some View {
        NavigationView {
            // MARK: - Main View
            TabView {
                List {
                    ForEach(manager.memoList) { memo in
                        NavigationLink {
                            DetailView(memo: memo)
                        } label: {
                            MemoView(memo: memo)
                        }
                    }
                    .onDelete(perform: manager.memoDelete)
                }
                .tabItem {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                    Text("My Memo")
                }
                
                // MARK: - Second View
                
                TabView {
                    Text("second page")
                }
                .tabItem {
                    Image(systemName: "person")
                        .resizable()
                    Text("Scedule")
                }
            }
            .navigationTitle("Memo")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    isPressedPlusButton = true
                } label: {
                    Image(systemName: "plus")
                }
                .padding()
            }
            .sheet(isPresented: $isPressedPlusButton) {
                NewMemoView()
            }
        }
        .navigationViewStyle(.stack)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MemoManager())
    }
}
