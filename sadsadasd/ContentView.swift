//
//  startSida.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var animationAmount = 1.0
    @State var onClick = false
    @State var countryList = "LÄNDER"
    @State var letsPlay = "SPELA"
    @State var highScore = "TOPPLISTA"
    @State var letsPlayEng = "PLAY"
    @State var highScoreEng = "HIGHSCORE"
    
    var body: some View {
        NavigationView{
            
            
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
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                            
                        
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
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                        
                    }
                    
                    
                }
                .padding()
                
                
                globestart()
                    .background(.white)
                
                
                VStack{
                    
                    NavigationLink(destination: chooseQuiz())
                    {
                        
                        
                        Text(letsPlay)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 300, height: 70)
                            .background(Color("MyBlue"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                            .cornerRadius(30)
                            .padding(.bottom, 10.0)
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                        
                        
                    }
                    
                    /*
                     Button(action: {
                     onClick = true
                     }) {
                     Text(countryList)
                     .font(.largeTitle)
                     .fontWeight(.semibold)
                     .padding()
                     .foregroundColor(.white)
                     .frame(width: 300, height: 70)
                     .background(Color("MyBlue"))
                     .overlay(
                     RoundedRectangle(cornerRadius: 30)
                     .stroke(Color.black, lineWidth: 5)
                     )
                     .cornerRadius(30)
                     }.fullScreenCover(isPresented: $onClick) {
                     CountryListView()
                     }
                     */
                    
                    
                    
                    
                    NavigationLink(destination: LeaderBoardView())
                    {
                        
                        
                        Text(highScore)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 300, height: 70)
                            .background(Color("MyBlue"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                            .cornerRadius(30)
                            .padding(.bottom, 10.0)
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                        
                        
                    }
                    
                    
                    
                }
                NavigationLink(destination: CountryListView())
                {
                    
                    
                    Text(countryList)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 70)
                        .background(Color("MyBlue"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 5)
                        )
                        .cornerRadius(30)
                        .padding(.bottom, 10.0)
                        .shadow(color: .black, radius: 4, x: 0, y: 0)
                }
                
            }.background(.white)
            
            
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
            .previewDevice("iPhone 13")
    }
}

/*
 NavigationLink(destination: CountryListView())
 {
 
 
 Text(countryList)
 .font(.largeTitle)
 .fontWeight(.semibold)
 .padding()
 .foregroundColor(.white)
 .frame(width: 300, height: 70)
 .background(Color("MyBlue"))
 .overlay(
 RoundedRectangle(cornerRadius: 30)
 .stroke(Color.black, lineWidth: 5)
 )
 .cornerRadius(30)
 
 
 }
 */


/*
 Button(action: {
 onClick = true
 }) {
 Text(countryList)
 .font(.largeTitle)
 .fontWeight(.semibold)
 .padding()
 .foregroundColor(.white)
 .frame(width: 300, height: 70)
 .background(Color("MyBlue"))
 .overlay(
 RoundedRectangle(cornerRadius: 30)
 .stroke(Color.black, lineWidth: 5)
 )
 .cornerRadius(30)
 }.fullScreenCover(isPresented: $onClick) {
 CountryListView()
 }
 */
