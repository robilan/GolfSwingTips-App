//
//  ContentView.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-08.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    // Test Github
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                        print("DEBUG: Show menu here....")
                    }, label: {
                        Image(systemName: "list.bullet.rectangle")
                            .foregroundColor(.black)
                    }))
                    .navigationBarTitle("Swing Tips", displayMode: .inline)
            }
            // show the HomeView when pressing the "go back" button from a NavigationLink page. Without this the menu will show with the HomeView shoved to the right
            .onAppear {
                isShowing = false
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    @ObservedObject var menus = GolfTipModel.SwingMenu()
    var body: some View {
        
        Spacer()
            List {
                    ForEach(menus.items) { menu in
                        HStack {
                            Text("\(menu.swingType)")
                                .frame(width: 200, height: 25, alignment: .leading)
                                .font(.headline)
                            Spacer()
                            NavigationLink(destination: DetailView(forSwingType: menu.swingType),label: {
                                Text("")
                            })
                            .frame(width: 75, height: 25, alignment: .center)
                        }
                        
                    }
            }
    }
}
