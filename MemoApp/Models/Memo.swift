//
//  Memo.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

//Memo Model
final class Memo: Identifiable, ObservableObject {
    var id: UUID
    @Published var memo: String
    var date: Date
    
    init(memo: String, date: Date = Date.now) {
        self.id = UUID()
        self.memo = memo
        self.date = date
    }
}
