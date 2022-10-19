//
//  AppManager.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-15.
//

import Foundation
import Combine

struct AppManager {
    static let Authenticated = PassthroughSubject<Bool, Never>()
    
    static func IsAuthenticated() -> Bool {
        return UserDefaults.standard.string(forKey: "token") != nil
    }
}
