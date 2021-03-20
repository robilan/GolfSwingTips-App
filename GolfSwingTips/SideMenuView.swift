//
//  SideMenuView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-13.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @ObservedObject var swingTypes = GolfTipModel.SwingMenu()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    if option.title == "Videos" {
                        NavigationLink(destination: VideoView(),
                            label: {
                                SideMenuOptionView(viewModel: option)
                            })
                    }
                    else {
                        if option.title == "Swing Types" {
                            NavigationLink(destination: SwingTypeView(swingTypes: self.swingTypes),
                                label: {
                                    SideMenuOptionView(viewModel: option)
                                })
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
