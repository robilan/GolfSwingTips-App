//
//  VideoDetailView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-17.
//

import SwiftUI

struct VideoDetailView: View {
    var forSwingType: String
    @State private var displayAdd = false
    @ObservedObject var videos = GolfTipModel.Videos()
    @Environment(\.openURL) var openURL
    @State var editMode: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos.items) { video in
                    if video.swingType == forSwingType {
                        Button("\(video.videoDescription)") {
                            openURL(URL(string: "\(video.video)")!)
                        }
//                        Link("\(video.videoDescription)", destination: URL(string: "\(video.video)")!)
                    }
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Videos for \(forSwingType)", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.editMode = !self.editMode
            }, label: {
                Text(!self.editMode ? "Edit" : "Done")
            }), trailing: Button(action: {
                self.displayAdd = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $displayAdd) {
                AddVideoView(videos: self.videos, forSwingType: forSwingType)
            }
            .environment(\.editMode, .constant(self.editMode ? EditMode.active : EditMode.inactive))
        }
        .listStyle(GroupedListStyle())
    }
    func move(from source: IndexSet, to destination: Int) {
        videos.items.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet) {
        videos.items.remove(atOffsets: offsets)
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(forSwingType: "Driver")
    }
}
