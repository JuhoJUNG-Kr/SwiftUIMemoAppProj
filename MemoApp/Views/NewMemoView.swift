//
//  NewMemoView.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

struct NewMemoView: View {
    @EnvironmentObject var memomanager: MemoManager
    var memo: Memo? = nil
    @Environment(\.dismiss) var dismiss
    @State private var newMemo: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $newMemo)
                    .background(.red)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            newMemo = memo.memo
                        }
                    }
            }
            .navigationTitle(memo != nil ? "Edit Memo" : "New Memo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .padding()
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            memomanager.memoUpdate(memo: memo, content: newMemo)
                        } else {
                            memomanager.insert(memo: newMemo)
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                            .padding()
                    }
                }
                
            }
        }
    }
}

struct NewMemoView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoView()
    }
}
