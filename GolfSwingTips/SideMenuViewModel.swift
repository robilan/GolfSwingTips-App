//
//  SideMenuViewModel.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-13.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case swingType
    case video
    
    var title: String {
        switch self {
        case .swingType: return "Swing Types"
        case .video: return "Videos"
        }
    }
    var imageName: String {
        switch self {
        case .swingType: return "list.bullet.rectangle"
        case .video: return "video.circle"
        }
    }
//    var navLink: String {
//        switch self {
//        case .swingType: return "BLANK"
//        case .video: return "DetailView(forSwingType: menu.swingType)"
//        }
//    }
}
