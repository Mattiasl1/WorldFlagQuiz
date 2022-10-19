//
//  loginModel.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-15.
//

import Foundation
import Combine

class looginModel: ObservableObject {
    @Published var myPlayerName
    
    var errorMessage = ""
    
}

extension loginModel {
    func loginUser() {
        if myPlayerName == "Mattias" {
            let token = UUID().uuidString
            UserDefaults.standard.set(token, forKey: "token")
            AppManager.Authenticated.send(true)
            
            
        } else {
            errorMessage = "invalid username"
            
        }
    }
}
