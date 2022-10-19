//
//  UserModel.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-07.
//

import Foundation

class Player : Identifiable {
    
    let id = UUID()
    
    var fbid = ""
    var username = ""
    var worldHighscore = ""
    var europeHighscore = ""
    var asiaHighscore = ""
    var africaHighscore = ""
    var americaHighscore = ""
    
}
