//
//  VideoView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-09.
//

import SwiftUI

struct VideoView: View {
    
//    var forSwingType: String
    @State private var displayAdd = false
    @ObservedObject var menus = GolfTipModel.SwingMenu()
    @Environment(\.openURL) var openURL
    @State var editMode: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menus.items) { menu in
                    HStack {
                        Text("\(menu.swingType)")
                            .frame(width: 200, height: 25, alignment: .leading)
                            .font(.headline)
                        Spacer()
                        NavigationLink(destination: VideoDetailView(forSwingType: menu.swingType),label: {
                            Text("")
                        })
                        .frame(width: 75, height: 25, alignment: .center)
                    }
                    
                }
            }
            .navigationBarTitle("Videos", displayMode: .inline)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
