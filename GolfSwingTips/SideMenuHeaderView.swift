//
//  SideMenuHeaderView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-13.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button( action: { withAnimation(.spring()) {
                isShowing.toggle()
            } }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 100)
                    .foregroundColor(.white)
                    .padding()
            })
            
            VStack(alignment: .leading) {
                Image(systemName: "questionmark.video.fill")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                HStack {
                    Text("Andre Robillard")
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                }
                Spacer()
            }
            
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
