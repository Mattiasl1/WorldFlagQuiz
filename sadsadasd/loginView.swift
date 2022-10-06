//
//  loginView.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-06.
//

import SwiftUI
import AVFoundation


struct loginView: View {
    @State var countryList = "LÄNDER"
    @State var choosePlayername = "Player name"
    @State var saveName = "Save"
    @State var playerName = ""
    
    
    var body: some View {
        
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            VStack {
                
                HStack{
                    
                    
                    Button {
                        
                        UserDefaults.standard.set("sv", forKey: "lang")
                        doLang()
                        
                        countryList = "LÄNDER"
                        print("Now Swedish")
                        AudioServicesPlaySystemSound(1306)
                    } label: {
                        
                        Image("SWEliten").resizable()
                            .frame(width: 60, height: 40)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                            .padding(.leading, 60.0)
                            .brightness(0.1)
                            .shadow(color: .black, radius: 1, x: 0, y: 0)
                            
                            
                        
                    }
                    
                    
                    Button {
                        UserDefaults.standard.set("en", forKey: "lang")
                        doLang()
                        
                        countryList = "COUNTRIES"
                        print("Now English")
                        AudioServicesPlaySystemSound(1306)
                    } label: {
                        Image("ENGliten").resizable()
                            .frame(width: 60, height: 40)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                            .padding(.trailing, 60.0)
                            .brightness(0.1)
                            .shadow(color: .black, radius: 1, x: 0, y: 0)
                            
                            
                        
                    }
                    
                    
                }
                
                
                HStack {
                    Spacer()
                    TextField(choosePlayername, text: $playerName)
                        .font(MyFont.title18)
                        .frame(width: 220, height: 70, alignment: .center)
                        .foregroundColor(.white)
                        .textFieldStyle(.roundedBorder)
                    
                    
                    Spacer()
                    
                    
                }.onAppear(perform: {
                    doLang()
                    
            })
                
                Button(saveName) {
                    //Save username
                    // max 12 letters
                    // Go to quiz
                }.font(MyFont.title18)
                .padding()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 40)
                    .background(Color.green)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .cornerRadius(5)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
            }
        }
    }
    
    func doLang()
    {
        var lang = UserDefaults.standard.string(forKey: "lang")
        if(lang == nil)
        {
            UserDefaults.standard.set("en", forKey: "lang")
            lang = "en"
        }
        
        if(lang == "en")
        {
            
            choosePlayername = "Username"
            saveName = "Save"
        } else {
            
            choosePlayername = "Användarenamn"
            saveName = "Spara"
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}


