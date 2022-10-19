//
//  sadsadasdApp.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-15.
//

import SwiftUI
import Firebase

@main
struct sadsadasdApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
       
            //ContentView()
           // loginView()
            HomeView()
        }
    }
}
