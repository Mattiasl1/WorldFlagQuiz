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
            LinearGradient(gradient: Gradient(colors: [.white, .red, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
           // LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
             //   .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                Spacer()
                //gamescoreAM
                Text(recordText)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                Spacer()
                
                
                Text(String(americapoints))
                    .font(.system(size: 60))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 4, x: 0, y: 0)
                
                Spacer()
                Text(partOfW)
                    .font(.system(size: 80))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .underline(true, color: .red)
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
