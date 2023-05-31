//
//  MemoView.swift
//  MemoApp
//
//  Created by 정주호 on 31/05/2023.
//

import SwiftUI

struct MemoView: View {
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.memo)
                .font(.body)
                .lineLimit(1)
            Text(memo.date, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView(memo: Memo(memo: "testView"))
    }
}
