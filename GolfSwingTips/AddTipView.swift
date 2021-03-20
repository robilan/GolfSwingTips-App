//
//  AddTipView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-09.
//

import SwiftUI

struct AddTipView: View {
    
    @ObservedObject var tips: GolfTipModel.Tips
    @Environment(\.presentationMode) var presentationMode
    var forSwingType = ""
    @State private var tipText = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter the Tip", text: $tipText)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Tip  for \(forSwingType)", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let item = GolfTipModel.Tip(swingType: forSwingType, tip: tipText)
                self.tips.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddTipView_Previews: PreviewProvider {
    static var previews: some View {
        AddTipView(tips: GolfTipModel.Tips())
    }
}
