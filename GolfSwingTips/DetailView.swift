//
//  DetailView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-08.
//

import SwiftUI

struct DetailView: View {
    
    var forSwingType: String
    @State private var displayAdd = false
    @ObservedObject var tips = GolfTipModel.Tips()
    @Environment(\.openURL) var openURL
    @State var editMode: Bool = false
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(tips.items) { tip in
                        if tip.swingType == forSwingType {
                                Text("\(tip.tip)")
                        }
                    }
                    .onMove(perform: move)
                    .onDelete(perform: delete)
                }
                .navigationBarTitle("Tips for \(forSwingType)", displayMode: .inline)
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
                    AddTipView(tips: self.tips, forSwingType: forSwingType)
                }
                .environment(\.editMode, .constant(self.editMode ? EditMode.active : EditMode.inactive))
            }
        .listStyle(GroupedListStyle())    }
    func move(from source: IndexSet, to destination: Int) {
        tips.items.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet) {
        tips.items.remove(atOffsets: offsets)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(forSwingType: "Driver")
    }
}
