//
//  AltHomescreen.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-12-11.
//
//
//  startSida.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation

struct AltHomescreen: View {
    @State var animationAmount = 1.0
    @State var onClick = false
    @State var countryList = "LÄNDER"
    @State var letsPlay = "SPELA"
    @State var highScore = "TOPPLISTA"
    @State var letsPlayEng = "PLAY"
    @State var highScoreEng = "HIGHSCORE"
    
    var body: some View {
        
        
        NavigationView{
            
            
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    
                VStack {
                    
                    globestart()
                        .padding()
                    
                    Text("WORLD QUIZ")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .underline()
                        .foregroundColor(.white)
                        .padding()
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
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
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
                                .frame(width: 60, height: 40)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                                .padding(.trailing, 67.0)
                                .brightness(0.1)
                                .shadow(color: .black, radius: 4, x: 0, y: 0)
                                
                            
                        }
                        
                        
                    }
                    .padding()
                    
                    
                    
                    //globestart()
                        //.background(.white)
                    
                    
                    VStack{
                        
                        
                        NavigationLink(destination: chooseQuiz())
                        {
                            
                            
                            Text(letsPlay)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 300, height: 70)
                                .background(Color.green)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.black, lineWidth: 5)
                                )
                                .cornerRadius(30)
                                .padding(.bottom, 10.0)
                                .shadow(color: .black, radius: 4, x: 0, y: 0)
                                
                            
                            
                        }
            
                        NavigationLink(destination: LeaderBoardView())
                        {
                            
                            
                            Text(highScore)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 300, height: 70)
                                .background(Color.yellow)
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
                            .background(Color.brown)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                            .cornerRadius(30)
                            .padding(.bottom, 10.0)
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                    }
                    
                }
            }
            
            //.navigationBarTitle("")
               // .navigationBarHidden(true)
            
            
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
    
    private func leadingPadding(_ geometry: GeometryProxy) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            // A hack for correct display of the SplitView in SwiftUI on iPad
            return geometry.size.width < geometry.size.height ? 0.5 : -0.5
        }
        return 0
    }
    
}
struct AltHomescreen_Previews: PreviewProvider {
    static var previews: some View {
        AltHomescreen()
            .previewLayout(.sizeThatFits)
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