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
        // Not relevant to the demo, but I removed some spacers to tidy up the rows 😅
        HStack {
            Text(item.item)
            Spacer(minLength: 0)
            Button {
                saveOrUnsaveItemTapped()
            } label: {
                Image(systemName: item.saved ? "checkmark" : "square")
            }
        }
        
    }
}

//#Preview {
//    ItemRow(item: ItemListResponse(item: "Pizza", saved: true), saveOrUnsaveItemTapped: <#() -> Void#>)
//}
