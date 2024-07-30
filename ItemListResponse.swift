//
//  ItemListResponse.swift
//  ListIssueApp
//
//  Created by Kinney Kare on 7/30/24.
//

import Foundation


struct ItemListResponse: Codable, Identifiable {
    var id = UUID()
    let item: String
    let saved: Bool
}
