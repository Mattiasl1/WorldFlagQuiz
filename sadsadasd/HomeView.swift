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



struct HomeView: View {
    
   // @ObservedObject var fbUser = FbModel()
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
    @AppStorage("thename") var username = ""
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                    
                    
                    LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.2)
                   
                                   
                    
                    VStack {
                        
                        NavigationLink(destination: ProfileView())
                        {
                            HStack{
                                Image(systemName: "person.circle")
                                    .font(MyFont.Icon40)
                                    .foregroundColor(Color.black)
                                Text(username)
                                    .font(MyFont.title24)
                                    .foregroundColor(Color.black)
                            }
                                
                            
                            
                        }
                        
                        HStack{
                            Button {
                                
                                UserDefaults.standard.set("sv", forKey: "lang")
                                doLang()
                                
                                
                                print("Now Swedish")
                                
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
                                
                                
                                print("Now English")
                                
                            } label: {
                                Image("ENGliten").resizable()
                                    .frame(width: 60, height: 40)
                                    .padding(.trailing, 60.0)
                                    .brightness(0.1)
                                    .shadow(color: .black, radius: 1, x: 0, y: 0)
                                    
                                    
                                
                            }.padding(.horizontal)
                        }.padding(.bottom)
                        
                        /*
                         Button{
                             showingProfileSheet.toggle()
                         }
                     label: {
                         HStack{
                             Image(systemName: "person.circle")
                                 .font(MyFont.Icon40)
                                 .foregroundColor(Color.black)
                             Text(username)
                                 .font(MyFont.title24)
                                 .foregroundColor(Color.black)
                         }
                             
                         
                         
                     }.sheet(isPresented: $showingProfileSheet) {
                         
                         ProfileView()
                             .preferredColorScheme(.light)
                         
                     }
                         */
                        
                        VStack{
                            LottieView()
                                .frame(width: 250,
                                        height: 220)
                               
                            
                        }.padding(.bottom, 80)
                        
                            
                            
                        
                            
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
                
                            /*
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
                             */
                            
                            
                            
                        
                        
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
            }.onAppear(perform: {
                    
                    letsTrack()
                    doLang()
                  //  fbUser.loadScore()
                })
        }
        
        
            
            //.navigationBarTitle("")
               // .navigationBarHidden(true)
            
            
        
        
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
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.sizeThatFits)
            .previewDevice("iPhone 13")
    }
}



struct ProfileView: View {
    //@State var myplayerName = [Player]()
   // @ObservedObject var fbUser = FbModel()
     
    @AppStorage("thename") var username = ""
    @State var worldpoints = UserDefaults.standard.integer(forKey: "world")
    @State var eupoints = UserDefaults.standard.integer(forKey: "europe")
    @State var asiapoints = UserDefaults.standard.integer(forKey: "asia")
    @State var africapoints = UserDefaults.standard.integer(forKey: "africa")
    @State var americapoints = UserDefaults.standard.integer(forKey: "america")
   // @State var recordText = "All time high"
    @State var worldPoints = "Europe"
    @State var europePoints = "Europe"
    @State var asiaPoints = "Europe"
    @State var africaPoints = "Europe"
    @State var americaPoints = "Europe"
    @State var yourScore = "Score"
    
    
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.1)
            
            VStack{
                
                Image(systemName: "person.circle")
                    .foregroundColor(Color.black)
                    .font(MyFont.Icon40)
                Text(username)
                    .font(MyFont.title24)
                    .padding()
                Text(yourScore)
                    .font(MyFont.title24)
                Divider()
                    .padding(.bottom, 20)
                
                HStack{
                    VStack{
                        Text(worldPoints + String(worldpoints))
                            .font(MyFont.title18)
                            .padding()
                        
                        Text(europePoints + String(eupoints))
                            .font(MyFont.title18)
                            .padding()
                        
                        Text(asiaPoints + String(asiapoints))
                            .font(MyFont.title18)
                            .padding()
                        
                        Text(africaPoints + String(africapoints))
                            .font(MyFont.title18)
                            .padding()
                        
                        Text(americaPoints + String(americapoints))
                            .font(MyFont.title18)
                            .padding()
                        
                    }
                    
                    Spacer()
                }
                
                
                
            }.onAppear(perform: {
                doLang()
            })
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
            
            yourScore = "Your score"
            worldPoints = "The world: "
            europePoints = "Europe: "
            asiaPoints = "Asia: "
            africaPoints = "Africa: "
            americaPoints = "America: "
            
        } else {
            
            yourScore = "Dina Poäng"
            worldPoints = "Världen: "
            europePoints = "Europa: "
            asiaPoints = "Asien: "
            africaPoints = "Afrika: "
            americaPoints = "Amerika: "
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewLayout(.sizeThatFits)
            
    }
}
