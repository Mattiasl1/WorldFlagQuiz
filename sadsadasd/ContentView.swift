//
//  startSida.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    
    @State var countryList = "LÄNDER"
    @State var letsPlay = "SPELA"
    @State var highScore = "TOPPLISTA"
    @State var letsPlayEng = "PLAY"
    @State var highScoreEng = "HIGHSCORE"
    
    var body: some View {
        
        VStack {
            NavigationView{
                
                ZStack{
                    Color(.white)
                        .ignoresSafeArea()
                    
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
                                    .frame(width: 50, height: 40)
                                    .padding(.leading, 67.0)
                                    .brightness(0.1)
                                
                            }
                            Spacer()
                            
                            Button {
                                UserDefaults.standard.set("en", forKey: "lang")
                                doLang()
                                
                                countryList = "COUNTRIES"
                                print("Now English")
                                AudioServicesPlaySystemSound(1306)
                            } label: {
                                Image("ENGliten").resizable()
                                    .frame(width: 50, height: 40)
                                    .padding(.trailing, 67.0)
                                    .brightness(0.1)
                                
                            }
                            
                            
                        }
                        
                        
                        globestart()
                            .background(.black)
                            .padding(.all)
                        
                        
                        Spacer()
                        Spacer()
                        
                        
                        
                        
                        NavigationLink(destination: chooseQuiz())
                        {
                            
                            
                            Text(letsPlay)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 60)
                                .background(Color("MyBlue"))
                                .cornerRadius(10)
                                .border(Color.black, width: 2)
                            
                            
                        }
                        
                        
                        
                        Spacer()
                        
                        
                        NavigationLink(destination: LeaderBoardView())
                        {
                            
                            
                            Text(highScore)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 60)
                                .background(Color("MyBlue"))
                                .cornerRadius(10)
                                .border(Color.black, width: 2)
                            
                            
                        }
                        
                        
                        Spacer()
                        
                        NavigationLink(destination: CountryListView())
                        {
                            
                            
                            Text(countryList)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 60)
                                .background(Color("MyBlue"))
                                .cornerRadius(10)
                                .border(Color.black, width: 2)
                            
                            
                        }
                        
                        
                        Spacer()
                        
                        
                    }
                    
                    
                }
            }
            
            
        }.onAppear(perform: {
            
            doLang()
            
        })
        
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
            letsPlay = "PLAY"
            highScore = "HIGHSCORE"
            countryList = "COUNTRIES"
        } else {
            letsPlay = "SPELA"
            highScore = "TOPPLISTA"
            countryList = "LÄNDER"
        }
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

