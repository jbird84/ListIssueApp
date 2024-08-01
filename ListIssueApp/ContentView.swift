//
//  ContentView.swift
//  ListIssueApp
//
//  Created by Kinney Kare on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model = ItemListViewModel()
    
    private var items: [ItemListResponse] {
        return model.myItems
    }
    
    var body: some View {
        VStack {
            Text("My List")
        }
        .task {
            /// FYI: the `.task` modifier works like `.onAppear`, but it supports `async` work, and if the view disappears, it will cancel the work.
            await model.fetchMyItems()
        }
        
        List {
            ForEach(items) { item in
                ItemRow(item: item, saveOrUnsaveItemTapped: {
                    model.saveOrUnsaveTapped(for: item)
                })
            }
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
