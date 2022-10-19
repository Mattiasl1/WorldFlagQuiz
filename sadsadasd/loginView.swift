//
//  loginView.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-06.
//

import SwiftUI
import AVFoundation
import Firebase
import FirebaseAuth



struct loginView: View {
    @AppStorage("userOnboarded") var userOnboarded: Bool = false
    
    
    
   // @ObservedObject var fbUser = FbModel()
    
    @State private var showUsernameError = false
    @State var usernameErrorText = "Not valid username"
    @State var countryList = "LÄNDER"
    @State var choosePlayername = "Player name"
    @State var saveName = "Save"
    @State var welcomeText = "Welcome to World-Flagquiz"
    @State var chooseLangText = "Choose your language"
  //  @State var username = ""
    
    
  //  @State var showProfileSheet = false
    @AppStorage("thename") var username = ""
    
    
    var body: some View {
        
        NavigationView{
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                
                VStack {
                    
                    LottieView()
                        .frame(width: 250,
                                height: 250)
                        .padding(.bottom, 30)
                    Text("Welcome to World-Flagquiz")
                        .font(MyFont.title18)
                        .foregroundColor(Color.black)
                        .padding()
                    
                    Text("Choose your language")
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
                                .padding(.leading, 60.0)
                                .brightness(0.1)
                                .shadow(color: .black, radius: 1, x: 0, y: 0)
                                
                                
                            
                        }.padding(.horizontal)
                        
                        
                        Button {
                            UserDefaults.standard.set("en", forKey: "lang")
                            doLang()
                            
                            countryList = "COUNTRIES"
                            print("Now English")
                            AudioServicesPlaySystemSound(1306)
                        } label: {
                            Image("ENGliten").resizable()
                                .frame(width: 60, height: 40)
                                .padding(.trailing, 60.0)
                                .brightness(0.1)
                                .shadow(color: .black, radius: 1, x: 0, y: 0)
                                
                                
                            
                        }.padding(.horizontal)
                    }.padding(.bottom)
                    
                    HStack {
                        if showUsernameError == false {
                            TextField(choosePlayername, text: $username)
                                .font(MyFont.title18)
                                .frame(width: 220, height: 70, alignment: .center)
                                .foregroundColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .autocorrectionDisabled()
                        } else {
                            TextField(choosePlayername, text: $username)
                                .font(MyFont.title18)
                                .frame(width: 220, height: 70, alignment: .center)
                                .foregroundColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .autocorrectionDisabled()
                                .border(.red)
                        }
                        
                    }.onAppear(perform: {
                        doLang()
                        if let thesavedname = UserDefaults.standard.string(forKey: "thename") {
                            username = thesavedname
                        }
                        
                })
                    
                    
                    NavigationLink(destination: HomeView()){
                        Text(saveName)
                            .font(MyFont.title18)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 90, height: 40)
                                .background(Color.green)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .cornerRadius(5)
                    
                        
                    }.simultaneousGesture(TapGesture().onEnded {
                        
                        userOnboarded = true
                        print(UserDefaults.standard.bool(forKey: "userOnboarded"))
                        UserDefaults.standard.set(username, forKey: "thename")
                        print(username)
                        //Save username
                        // max 12 letters
                        // Go to quiz
                    })
                        
                }
                Spacer()
                
            }
        }.navigationBarBackButtonHidden()
        
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
            welcomeText = "Welcome to World-Flagquiz"
            chooseLangText = "Choose your language"
        } else {
            
            choosePlayername = "Användarnamn"
            saveName = "Spara"
            welcomeText = "Välkommen till World-Flagquiz"
            chooseLangText = "Välj ditt språk"
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}


