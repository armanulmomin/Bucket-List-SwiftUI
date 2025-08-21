//
//  DetailView.swift
//  BucketList
//
//  Created by Arman on 21/8/25.
//

import SwiftUI

struct DetailView: View {
    let bucketItem: BucketItem
    @State private var note = ""
    @State private var completedDate = Date.distantPast
    @Binding var bucketList: [BucketItem]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            TextField("Bucket Note", text: $note, axis: .vertical)
            if completedDate != Date.distantPast {
                DatePicker("Completed on", selection: $completedDate, displayedComponents: .date)
            }
            Button(completedDate == Date.distantPast ? "Add Date" : "Clear Date"){
                if completedDate == Date.distantPast {
                    completedDate = Date()
                }
                else{
                    completedDate = Date.distantPast
                }
                
                
            }
            .buttonStyle(.borderedProminent)
        }
            .onAppear(){
                note = bucketItem.note
                completedDate = bucketItem.completedDate
            }
            .toolbar{
                ToolbarItem {
                    Button("Update"){
                        if let index = bucketList.firstIndex(where: {$0.id == bucketItem.id}){
                            bucketList[index].note = note
                            bucketList[index].completedDate = completedDate
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle(bucketItem.name)
    }
}

#Preview {
    let bucketItem = BucketItem.samples[2]
    let bucketList: Binding<[BucketItem]> = .constant(BucketItem.samples)
    NavigationStack {
        DetailView(bucketItem: bucketItem, bucketList: bucketList)
    }
}
