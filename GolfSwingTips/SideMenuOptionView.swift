//
//  SideMenuOptionView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-13.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 24)
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .video)
    }
}
