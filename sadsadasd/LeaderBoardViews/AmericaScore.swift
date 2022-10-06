//
//  AmericaScore.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct AmericaScore: View {
    
    @State var americapoints = UserDefaults.standard.integer(forKey: "america")
    
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
                    
                    Text(String(americapoints))
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
            partOfW = "America"
        } else {
            recordText = "Bästa score"
            partOfW = "Amerika"
        }
    }
}

struct AmericaScore_Previews: PreviewProvider {
    static var previews: some View {
        AmericaScore()
    }
}
