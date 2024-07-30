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
        .onAppear {
            Task {
                await fetchItems()
            }
        }
        
        List {
            ForEach(items) { item in
                ItemRow(item: item, saveOrUnsaveItemTapped: {
                    //NOTE: When Item Image is tapped make api call and either update image to unsave (show square) or save (show checkmark)
                //    saveOrUnsaveItemTapped(isSaved: item.saved)
                })
            }
        }
        .padding()
    }
    
    private func fetchItems() async {
         await model.fetchMyItems()
            }
    
    //I know this isn;t working right. But when I tap the image I want to decide which API call to make and when they finish SUCCESSFULLY then toggle to image to the opposite. I only want to do this for the current item without refreshing the whole list.
    private func saveOrUnsaveItemTapped(isSaved: Bool) async {
        if isSaved {
            await model.unSaveItem()
        } else {
            await model.saveItem()
        }
    }
    }



#Preview {
    ContentView()
}
