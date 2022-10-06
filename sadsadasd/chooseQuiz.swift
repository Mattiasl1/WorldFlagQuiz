//
//  chooseQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation
import Firebase
import SpriteKit




struct chooseQuiz: View {
    
    @State var headertext = "Välj Quiz"
    
    @State var bildbild = "star"
    @State var EU = "Europa"
    @State var AS = "Asien"
    @State var AF = "afrika"
    @State var AM = "Amerika"
    @State var VN = "Världen"
    
    
    
    var body: some View {
        
        
        
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            /*
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            */
            
            
            
            
            VStack{
                Text(headertext)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .fontWeight(.semibold)
                    .font(.title)
                    .shadow(color: .black, radius: 1, x: 0, y: 0)
                
                
                
                
                VStack{
                    NavigationLink(destination: AllQuiz()) {Text(VN)
                            .font(.title2)
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
                    
                    
                        
                        
                    NavigationLink(destination: EuropeQuiz())
                    
                    
                    {Text(EU)
                            .font(.title2)
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
                    
                    
                    
                    NavigationLink(destination: AsiaQuiz()) {Text(AS)
                            .font(.title2)
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
                    
                    
                    NavigationLink(destination: AfricaQuiz()) {Text(AF)
                            .font(.title2)
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
                    
                    
                    NavigationLink(destination: AmericaQuiz()) {Text(AM)
                            .font(.title2)
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
            
        }.onAppear(perform: {
            
            doLang()
            letsTrackQuiz()
        })
    }
    func letsTrackQuiz() {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "Choose quiz"])
        /*
         AnalyticsParameterItemName: AS,
         AnalyticsParameterItemName: AF,
         AnalyticsParameterItemName: AM,
         AnalyticsParameterItemName: VN,
         */
       // Analytics.logEvent("test", parameters: nil)
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
            EU = "Europe"
            AS = "Asia"
            AF = "Africa"
            AM = "America"
            VN = "World"
            headertext = "Choose Quiz"
        } else {
            EU = "Europa"
            AS = "Asien"
            AF = "Afrika"
            AM = "Amerika"
            VN = "Världen"
            headertext = "Välj Quiz"
        }
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



struct chooseQuiz_Previews: PreviewProvider {
    static var previews: some View {
        chooseQuiz()
            .previewLayout(.sizeThatFits)
    }
}
