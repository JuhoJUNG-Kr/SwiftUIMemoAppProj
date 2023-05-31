//
//  MemoManager.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

final class MemoManager: ObservableObject {
    @Published var memoList: [Memo]
    
    init() {
        memoList = [
            Memo(memo: "hi!"),
            Memo(memo: "Hello"),
            Memo(memo: "fuck you")
        ]
    }
    
    func newMemoButtonPressed(memo: String) {
        memoList.insert(Memo(memo: memo), at: 0)
    }
}
