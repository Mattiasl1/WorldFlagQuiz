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
            
            LinearGradient(gradient: Gradient(colors: [.white, .red, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .overlay(SpriteView(scene: snowFall(), options: [.allowsTransparency]))
                .edgesIgnoringSafeArea(.all)
            
            /*
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            */
            
            
            
            
            VStack{
                Text(headertext)
                    .foregroundColor(.white)
                    .padding()
                    .font(.largeTitle)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                
                
                
                
                Spacer()
                
                /*
                 HStack{
                 Text("Premium:")
                 .foregroundColor(.white)
                 .padding(.leading)
                 .font(.title)
                 Image(systemName: bildbild)
                 .font(.title)
                 .foregroundColor(.yellow)
                 Spacer()
                 Button(action: {
                 bildbild = "star.fill"
                 
                 }) {
                 Text("Bli Premium")
                 .foregroundColor(.black)
                 .frame(width: 100, height: 40)
                 .background(.mint)
                 .padding(.horizontal)
                 
                 
                 }
                 }
                 */
                
                
                
                Spacer()
                
                VStack{
                    NavigationLink(destination: AllQuiz()) {Text(VN)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 150)
                            .background(Color.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 8)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 10.0)
                            .shadow(color: .black, radius: 6, x: 0, y: 0)
                    }
                    
                    HStack{
                        
                        
                    NavigationLink(destination: EuropeQuiz())
                    
                    
                    {Text(EU)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 150)
                            .background(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 8)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 30.0)
                            .shadow(color: .black, radius: 6, x: 0, y: 0)
                        
                        
                        
                    }
                    
                    
                    
                    NavigationLink(destination: AsiaQuiz()) {Text(AS)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 150)
                            .background(Color.purple)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 8)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 30.0)
                            .shadow(color: .black, radius: 6, x: 0, y: 0)
                    }
                    }
                    HStack{
                    NavigationLink(destination: AfricaQuiz()) {Text(AF)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 150)
                            .background(Color.orange)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 8)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 30.0)
                            .shadow(color: .black, radius: 6, x: 0, y: 0)
                    }
                    
                    
                    NavigationLink(destination: AmericaQuiz()) {Text(AM)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 150)
                            .background(Color.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 8)
                            )
                            .cornerRadius(10)
                            .padding(.bottom, 30.0)
                            .shadow(color: .black, radius: 6, x: 0, y: 0)
                        
                    }
                    }
                    
                    
                    
                }
                
                Spacer()
                
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
