//
//  GolfTipModel.swift
//  GolfSwingTips
//
//  Created by Andre Robillard on 2021-03-08.
//

import Foundation

final class GolfTipModel: ObservableObject {
    
    struct SwingType: Identifiable, Codable {
        var id = UUID()
        var swingType: String
    }
    
    class SwingMenu: ObservableObject {
        
        @Published var items = [SwingType]() {
            didSet {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "Types")
                }
            }
        }
        init() {
            if let items = UserDefaults.standard.data(forKey: "Types") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([SwingType].self, from: items) {
                    self.items = decoded
                    return
                }
            }
            self.items = []
            let swingTypesToLoad = ["Driver", "Hybrids", "Irons", "Pitches", "Chips", "Sand", "Putting"]
            var index = 1.0
            for type in swingTypesToLoad {
                let myType = SwingType(swingType: type)
                self.items.append(myType)
                index += 1.0
            }
        }

    }
    
    struct Tip: Identifiable, Codable {
        var id = UUID()
        var swingType: String
        var tip: String
    }
    
    class Tips: ObservableObject {
        @Published var items = [Tip]() {
            didSet {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "Tips")
                }
            }
        }
        init() {
            if let items = UserDefaults.standard.data(forKey: "Tips") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Tip].self, from: items) {
                    self.items = decoded
                    return
                }
            }
            self.items = []
        }
    }
    
    struct Video: Identifiable, Codable {
        var id = UUID()
        var swingType: String
        var videoDescription: String
        var video: String
    }
    
    class Videos: ObservableObject {
        @Published var items = [Video] () {
            didSet {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "Vids")
                }
            }
        }
        init() {
            if let items = UserDefaults.standard.data(forKey: "Vids") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Video].self, from: items) {
                    self.items = decoded
                    return
                }
            }
            self.items = []
        }
    }
}
