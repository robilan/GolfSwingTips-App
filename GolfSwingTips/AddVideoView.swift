//
//  AddVideoView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-17.
//

import SwiftUI

struct AddVideoView: View {
        @ObservedObject var videos: GolfTipModel.Videos
        @Environment(\.presentationMode) var presentationMode
        var forSwingType = ""
        @State private var videoLink = ""
        @State private var videoDescription = ""
        var body: some View {
            NavigationView {
                Form {
                    TextField("Enter Video Description", text: $videoDescription)
                    TextField("Enter url For Video starting with http", text: $videoLink)
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Add Video for \(forSwingType)", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Save") {
                    let item = GolfTipModel.Video(swingType: forSwingType, videoDescription: videoDescription, video: videoLink)
                    self.videos.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
        }
}

struct AddVideoView_Previews: PreviewProvider {
    static var previews: some View {
        AddVideoView(videos: GolfTipModel.Videos())
    }
}
