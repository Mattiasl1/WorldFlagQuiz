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
import Firebase
import SpriteKit



struct AltHomescreen: View {
    @State private var showingProfileSheet = false
    @State var animationAmount = 1.0
    @State var onClick = false
    @State var countryList = "LÄNDER"
    @State var letsPlay = "SPELA"
    @State var highScore = "TOPPLISTA"
    @State var letsPlayEng = "PLAY"
    @State var highScoreEng = "HIGHSCORE"
    
    @State var xPos1: CGFloat = 200
    @State var yPos1: CGFloat = 300
    @State var xPos2: CGFloat = 200
    @State var yPos2: CGFloat = 600
    @State var playerName = "Username"
    @State var choosePlayername = "Player name"
    @State var saveName = "Save"
    
    var body: some View {
        
        
        NavigationView{
            
            
                
            
            ZStack {
                
                
                LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
               
                
                //Normal theme
                /*
                 LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                     .edgesIgnoringSafeArea(.all)
                 */
                    
                    // Christmas theme
                /*
                 LinearGradient(gradient: Gradient(colors: [.white, .red, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                     .edgesIgnoringSafeArea(.all)
                     .overlay(SpriteView(scene: snowFall(), options: [.allowsTransparency]))
                     .edgesIgnoringSafeArea(.all)
                 */
                
               
                    
                                
                
                VStack {
                    
                        
                    globestart()
                        .padding()
                    
                    

                    Text("WORLD QUIZ")
                        .font(MyFont.title30)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                      //  .foregroundColor(.random)
                        .padding()
                    
                   
                    
                    .padding()
                    
                    
                    
                    //globestart()
                        //.background(.white)
                    
                    
                    VStack{
                        
                        
                        NavigationLink(destination: ProfileView())
                        {
                            VStack{
                                Image(systemName: "person.circle")
                                    .font(.system(size: 50))
                                    .foregroundColor(Color.black)
                                Text("Profile")
                                    .font(MyFont.title14)
                            }
                            
                                
                                
                        }.padding(.bottom, 20)
                        
                        NavigationLink(destination: chooseQuiz())
                        {
                            
                            
                            Text(letsPlay)
                                .font(MyFont.title24)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 250, height: 50)
                                .background(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .cornerRadius(5)
                                .padding(.bottom, 10.0)
                                .shadow(color: .black, radius: 2, x: 0, y: 0)
                                
                            
                            
                        }
            
                        NavigationLink(destination: LeaderBoardView())
                        {
                            
                            
                            Text(highScore)
                                .font(MyFont.title24)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 250, height: 50)
                                .background(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .cornerRadius(5)
                                .padding(.bottom, 10.0)
                                .shadow(color: .black, radius: 2, x: 0, y: 0)
                            
                            
                        }
                        
                        
                        
                    }
                    NavigationLink(destination: CountryListView())
                    {
                        
                        
                        Text(countryList)
                            .font(MyFont.title24)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                            .background(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .cornerRadius(5)
                            .padding(.bottom, 10.0)
                            .shadow(color: .black, radius: 2, x: 0, y: 0)
                    }
                    
                    
                    
                }
            }
            
            //.navigationBarTitle("")
               // .navigationBarHidden(true)
            
            
        }.onAppear(perform: {
            letsTrack()
            doLang()
            
        })
        
    }
    func letsTrack() {
       /* Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-\(title!)",
          AnalyticsParameterItemName: title!,
          AnalyticsParameterContentType: "cont",
        ])
        */
       // Analytics.logEvent("test", parameters: nil)
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: "Startscreen"])
        Analytics.logEvent(AnalyticsEventAppOpen, parameters: nil)
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
            choosePlayername = "Username"
            saveName = "Save"
        } else {
            letsPlay = "SPELA"
            highScore = "TOPPLISTA"
            countryList = "LÄNDER"
            choosePlayername = "Användarenamn"
            saveName = "Spara"
        }
    }
    
    private func leadingPadding(_ geometry: GeometryProxy) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            // A hack for correct display of the SplitView in SwiftUI on iPad
            return geometry.size.width < geometry.size.height ? 0.5 : -0.5
        }
        return 0
    }
    
    class snowFall: SKScene{
        override func sceneDidLoad() {
            
            size = UIScreen.main.bounds.size
            scaleMode = .resizeFill
            
            anchorPoint = CGPoint(x: 0.5, y: 1)
            
            backgroundColor = .clear
                
            
            let node = SKEmitterNode (fileNamed: "snowFall.sks")!
            addChild(node)
        }
    }
    
}
struct AltHomescreen_Previews: PreviewProvider {
    static var previews: some View {
        AltHomescreen()
            .previewLayout(.sizeThatFits)
            .previewDevice("iPhone 13")
    }
}



struct ProfileView: View {
    
    
    var body: some View {
        VStack{
            Text("Profile")
            
        }
    }
}

