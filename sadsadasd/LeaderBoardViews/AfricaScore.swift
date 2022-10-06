//
//  AfricaScore.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct AfricaScore: View {
    @State var africapoints = UserDefaults.standard.integer(forKey: "africa")
    
    @State var recordText = "All time high"
    @State var partOfW = "Europe"
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
           // LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
             //   .edgesIgnoringSafeArea(.all)
            
            
            VStack{
               
                HStack {
                    Text(recordText)
                        .font(.title)
                        .foregroundColor(.white)
                    .shadow(radius: 1)
                    
                    Text(String(africapoints))
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 10)
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
            recordText = "All time high"
            partOfW = "Africa"
        } else {
            recordText = "Bästa score"
            partOfW = "Afrika"
        }
    }
}

struct AfricaScore_Previews: PreviewProvider {
    static var previews: some View {
        AfricaScore()
    }
}
