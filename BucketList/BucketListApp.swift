//
//  BucketListApp.swift
//  BucketList
//
//  Created by Arman on 21/8/25.
//

import SwiftUI

@main
struct BucketListApp: App {
    @StateObject var dataStore = DataStore()
    var body: some Scene {
        WindowGroup {
            BucketListView()
                .environmentObject(dataStore)
        }
    }
}
