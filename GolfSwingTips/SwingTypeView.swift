//
//  SwingTypeView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-18.
//

import SwiftUI

struct SwingTypeView: View {
    @ObservedObject var swingTypes: GolfTipModel.SwingMenu
    @Environment(\.presentationMode) var presentationMode
    @State private var showAddSwingType = false
    @State var editMode: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(swingTypes.items) { type in
                    Text(type.swingType)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle("Swing Types", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.editMode = !self.editMode
            }, label: {
                Text(!self.editMode ? "Edit" : "Done")
            }), trailing: Button(action: {
                self.showAddSwingType = true
            }, label: {
                Image(systemName: "plus")
            }))
            .environment(\.editMode, .constant(self.editMode ? EditMode.active : EditMode.inactive))
            .sheet(isPresented: $showAddSwingType) {
                AddSwingType(swingTypes: self.swingTypes)
            }
        }
    }
    func move(from source: IndexSet, to destination: Int) {
        swingTypes.items.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet) {
        swingTypes.items.remove(atOffsets: offsets)
    }
}

struct SwingTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SwingTypeView(swingTypes: GolfTipModel.SwingMenu())
    }
}
