//
//  DetailView.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var memomanager: MemoManager
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.memo)
                            .padding()
                        Spacer()
                    }
                    
                    Text(memo.date, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("My Memo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("Delete Memo", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        memomanager.memoDeleteAll(memo: memo)
                        dismiss()
                    } label: {
                        Text("Delete")
                    }
                } message: {
                    Text("Are you sure for delete this memo?")
                }

                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
                .padding()
            }
        }
        .sheet(isPresented: $showComposer) {
            NewMemoView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(memo: "testMemo"))
            .environmentObject(MemoManager())
    }
}
