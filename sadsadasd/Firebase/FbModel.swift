//
//  FbModel.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-07.
//

/*
 import Foundation
 import SwiftUI
 import Firebase
 import FirebaseDatabase


 class FbModel : ObservableObject {
     
     var ref: DatabaseReference!
     @Published var myplayerName = [Player]()
     @Published var myUsername = ""
     @Published var errormessage = ""
     
     init() {
         ref = Database.database(url: "https://worldquizgame-6665e-default-rtdb.europe-west1.firebasedatabase.app").reference()
     }
     
     /*
      var username = ""
      var worldHighscore = ""
      var europeHighscore = ""
      var asiaHighscore = ""
      var africaHighscore = ""
      var americaHighscore = ""
      var saveScore = ["username" : username, "worldHighscore" : worldHighscore, "europeHighscore" : europeHighscore, "asiaHighscore" : asiaHighscore, "africaHighscore" : africaHighscore, "americaHighscore" : americaHighscore]
      
      */
     func letsSaveScore(username : String, worldHighscore : String, europeHighscore : String, asiaHighscore : String, africaHighscore : String, americaHighscore : String) {
         
         ref.child("flagquizhighscore").childByAutoId().setValue(letsSaveScore) {err, fbref in
             print("Sparat highscore")
             self.loadScore()
             
         }
     }
     
     // + "europeHighscore" + "asiaHighscore" + "africaHighscore" + "americaHighscore"
     func loadScore() {
         ref.child("flagquizhighscore").getData(completion: {error, snapshot in
             guard error == nil else {
                 print(error!.localizedDescription)
                 return;
                 
             }
             DispatchQueue.main.async {
                             self.myplayerName.removeAll()
                         }
             
             for scoresnapchild in snapshot.children {
                 var childdaatasnap = scoresnapchild as! DataSnapshot
                 
                 var scoredict = childdaatasnap.value as! [String : String]
                 print(scoredict["worldHighscore"])
                 
                 var tempName = Player()
                 tempName.fbid = childdaatasnap.key
               //  tempName.username = usernamedict["username"]!
                 
                 DispatchQueue.main.async {
                     self.myplayerName.append(tempName)
                 }
             }
             
         })
     }
     
 }
 */



/*
 func loadUsername() {
     ref.child("myUsername").getData(completion: {error, snapshot in
         guard error == nil else {
             print(error!.localizedDescription)
             return;
             
         }
         DispatchQueue.main.async {
                         self.myplayerName.removeAll()
                     }
         
         for snapchild in snapshot.children {
             var childdaatasnap = snapchild as! DataSnapshot
             var usernamedict = childdaatasnap.value as! String
             //print(usernamedict["myUsername"])
             
             var tempName = Player()
             tempName.fbid = childdaatasnap.key
           //  tempName.username = usernamedict["username"]!
             
             DispatchQueue.main.async {
                 self.myplayerName.append(tempName)
             }
         }
         
     })
 }
 
 
 
 
 func addUsername(name : String) {
     
     if(name == ""){
         errormessage = "Invalid username"
         return
     }
      
     var saveUsername = ["username" : name]
     
     ref.child("users").childByAutoId().setValue(["username" : saveUsername]) {err, fbref in
         print("Sparat användarnamn")
     }
 }
 */
