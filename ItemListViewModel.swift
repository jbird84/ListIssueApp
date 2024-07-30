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
    
    //NOTE: Save and Unsave Item are commented out but the is the REAL code used in my BIGGER app. Just using this for placeholders for this point.
    
    func saveItem() async {
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
    
    func unSaveItem() async {
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
