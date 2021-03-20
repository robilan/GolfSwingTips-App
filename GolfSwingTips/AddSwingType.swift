//
//  AddSwingType.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-18.
//

import SwiftUI

struct AddSwingType: View {
    @ObservedObject var swingTypes: GolfTipModel.SwingMenu
    @Environment(\.presentationMode) var presentationMode
    @State private var swingName = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter new Swing Type Description", text: $swingName)
                List {
                    Text("")
                    Text("Swing Types Already Created")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.blue)
                        .font(.headline)
                    ForEach(swingTypes.items) { type in
                        Text(type.swingType)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Swing Type", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let item = GolfTipModel.SwingType(swingType: swingName)
                self.swingTypes.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddSwingType_Previews: PreviewProvider {
    static var previews: some View {
        AddSwingType(swingTypes: GolfTipModel.SwingMenu())
    }
}
