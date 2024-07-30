//
//  ItemRow.swift
//  ListIssueApp
//
//  Created by Kinney Kare on 7/30/24.
//

import SwiftUI

struct ItemRow: View {
    
    var item: ItemListResponse
    
    var saveOrUnsaveItemTapped: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Text(item.item)
            Spacer()
            Button {
                saveOrUnsaveItemTapped()
            } label: {
                Image(systemName: item.saved ? "checkmark" : "square")
            }
        Spacer()
        }
        
    }
}

//#Preview {
//    ItemRow(item: ItemListResponse(item: "Pizza", saved: true), saveOrUnsaveItemTapped: <#() -> Void#>)
//}
