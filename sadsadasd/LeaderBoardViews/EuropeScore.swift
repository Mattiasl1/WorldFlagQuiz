//
//  EuropeScore.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct EuropeScore: View {
    
    //@AppStorage("gameScoreEU") private var gameScoreEU = 0
    
    @State var eupoints = UserDefaults.standard.integer(forKey: "europe")
    @State var recordText = "All time high"
    @State var partOfW = "Europe"
    
    var body: some View {
        
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.white, .red, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
           // LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
             //   .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                Spacer()
                Text(recordText)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                Spacer()
                //gamescoreEU
                
                Text(String(eupoints))
                    .font(.system(size: 60))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .shadow(color: .green, radius: 4, x: 0, y: 0)
                
                
                
                
                Spacer()
                Text(partOfW)
                    .font(.system(size: 80))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .underline(true, color: .green)
                
                
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                
                
                Spacer()
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
            recordText = "All time high"
            partOfW = "Europe"
        } else {
            recordText = "Bästa score"
            partOfW = "Europa"
        }
    }
    
}

struct EuropeScore_Previews: PreviewProvider {
    static var previews: some View {
        EuropeScore()
    }
}

