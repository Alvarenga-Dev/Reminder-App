//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Lucas Alvarenga on 20/05/25.
//

import Foundation

class UserDefaultsManager {
    private static let userKey = "userKey"
    
    static func saveUser(user: User) {
        let enconder = JSONEncoder()
        if let data = try? enconder.encode(user) {
            UserDefaults.standard.set(data, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func getUser() -> User? {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: userKey) {
            return try? decoder.decode(User.self, from: data)
        }
        return nil
    }
}
