//
//  PreferenceManager.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

class PreferenceManager: NSObject {
    
    // Shared instance of the preference manager
    static let shared = PreferenceManager()
    
    // UserDefaults instance
    private lazy var defaults : UserDefaults = {
        UserDefaults.standard
    }()
    
    // MARK: - Clear UserDefaults
    
    // Remove all data from UserDefaults
    func clear() {
        guard let domain = Bundle.main.bundleIdentifier else {
            return
        }
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
    }
    
    // MARK: - Preferences
    
    // User logged in preference
    var loggedIn: Bool {
        set {
            defaults.setValue(newValue, forKey: PreferenceKey.isLoggedIn.rawValue)
            defaults.synchronize()
        } get {
            return defaults.value(forKey: PreferenceKey.isLoggedIn.rawValue) as? Bool ?? false
        }
    }
    


    // User data dictionary preference
    var userDataDict: NSDictionary {
        set {
            defaults.setValue(newValue, forKey: PreferenceKey.userData.rawValue)
            defaults.synchronize()
        } get {
            let userDict = defaults.value(forKey: PreferenceKey.userData.rawValue) as? NSDictionary ?? NSDictionary()
            return userDict
        }
    }
    
    // User accounts array preference
}

enum PreferenceKey: String {
    case isLoggedIn = "Logged_In"
    case userData = "userData"
}
