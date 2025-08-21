//
//  BucketItem.swift
//  BucketList
//
//  Created by Arman on 21/8/25.
//

import Foundation
struct BucketItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var note = ""
    var completedDate = Date.distantPast
    
    static var samples: [BucketItem] = [
        BucketItem(name: "Learn Swift"),
        BucketItem(name: "Run a marathon", note: "Become the first champion"),
        BucketItem(name: "Travel to Japan", note: "Within 2030", completedDate: Date()),
    ]
}
