//
//  ItemListViewModel.swift
//  ListIssueApp
//
//  Created by Kinney Kare on 7/30/24.
//

import Foundation
import SwiftUI

@Observable
class ItemListViewModel: ObservableObject {
    
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    var myItems: [ItemListResponse] = []
    
    //I have one api call that fetches and sets myItems to the response. But for simplicity I am going to create tempData
    
    func fetchMyItems() async {
        
        let items = [
        ItemListResponse(item: "Pizza", saved: true),
        ItemListResponse(item: "Scissors", saved: true),
        ItemListResponse(item: "Car", saved: false),
        ItemListResponse(item: "Toy", saved: false),
        ItemListResponse(item: "Baseball", saved: false),
        ItemListResponse(item: "Disc", saved: true),
        ItemListResponse(item: "Basket", saved: true),
        ItemListResponse(item: "Runner", saved: false),
        ItemListResponse(item: "Building", saved: false),
        ItemListResponse(item: "Apple", saved: true)
        ]
        myItems = items
        }

    func saveOrUnsaveTapped(for item: ItemListResponse) {
        // We need a Task here since the two functions are async. But they probably don't need to be, at least as they are currently written, and then we could delete the Task. See note below.
        Task {
            if item.saved {
                await unSaveItem(item)
            } else {
                await saveItem(item)
            }
        }
    }

    //NOTE: Save and Unsave Item are commented out but the is the REAL code used in my BIGGER app. Just using this for placeholders for this point.

    // These functions don't need to be async because they are not doing any async work themselves. They are just calling out to a Task to do the async work.
    func saveItem(_ item: ItemListResponse) async {
        // simulate the server doing stuff. This also shows why you might want to either change the checkmark right away on the assumption that the request will finish, or show a loading spinner in the row until the network request finishes.
        // You might also consider adopting the swift-identified-collections repo, which would let you have an IdentifiedArrayOf<ItemListResponse>, and the following code would look like:
        // myItems[id: item.id]?.saved = true
        try? await Task.sleep(for: .seconds(1))
        if let itemIndex = myItems.firstIndex(where: { $0.id == item.id }) {
            myItems[itemIndex].saved = true
        }
//        status = .fetching
//        Task {
//            do {
//                let responseData = try await
//                APIClient.saveJob(jobId: id, usingToken: Utils.getAccessToken() ?? "")
//                // Handle successful login with responseData
//                wasJobSaved = responseData.isSuccess()
//                status = .success
//            } catch {
//                if !Task.isCancelled {
//                    errorMessage = "There was an issue getting saving job."
//                    status = .failed(error: error)
//                }
//            }
//        }
    }
    
    func unSaveItem(_ item: ItemListResponse) async {
        // simulate the server doing stuff. This also shows why you might want to either change the checkmark right away on the assumption that the request will finish, or show a loading spinner in the row until the network request finishes.
        // You might also consider adopting the swift-identified-collections repo, which would let you have an IdentifiedArrayOf<ItemListResponse>, and the following code would look like:
        // myItems[id: item.id]?.saved = false
        try? await Task.sleep(for: .seconds(1))
        if let itemIndex = myItems.firstIndex(where: { $0.id == item.id }) {
            myItems[itemIndex].saved = false
        }
//        status = .fetching
//        Task {
//            do {
//                let responseData = try await
//                APIClient.UnSaveJob(jobId: id, usingToken: Utils.getAccessToken() ?? "")
//                // Handle successful login with responseData
//                wasJobSaved = !responseData.isSuccess()
//                status = .success
//            } catch {
//                if !Task.isCancelled {
//                    errorMessage = "There was an issue getting saving job."
//                    status = .failed(error: error)
//                }
//            }
//        }
    }
    
}
