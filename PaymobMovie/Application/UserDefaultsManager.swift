//
//  UserDefaultsManager.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

class UserDefaultsManager {
    
    let userDefaults = UserDefaults.standard
    
    static let shared = UserDefaultsManager()
    
    
    private init() { }
    
    var favortieIDs : [Int] {
        get {
            userDefaults.object(forKey: "favortieIDs") as? [Int] ?? []
        } set {
            userDefaults.set(newValue, forKey: "favortieIDs")
        }
    }
}
