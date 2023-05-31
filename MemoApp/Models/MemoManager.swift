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
    
    func insert(memo: String) {
        memoList.insert(Memo(memo: memo), at: 0)
    }
    
    func memoUpdate(memo: Memo?, content: String) {
        guard let memo = memo else { return }
        memo.memo = content
    }
    
    func memoDeleteAll(memo: Memo) {
        memoList.removeAll { $0.id == memo.id }
    }
    
    func memoDelete(set: IndexSet) {
        for index in set {
            memoList.remove(at: index)
        }
    }
}
