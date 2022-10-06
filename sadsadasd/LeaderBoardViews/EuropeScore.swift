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
    @State var lista = ["hej", "hej2", "hej3"]
    
    var body: some View {
        
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            
            VStack{
                Text("Highscore")
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 1)
                    .padding()
                List(lista, id: \.self) { list in
                    HStack{
                        
                        Text("Usernamehere")
                        Spacer()
                        Text("Points: " + "70")
                        
                            
                        
                        
                    }.scaledToFit()
                }
               
                HStack {
                    Text(recordText)
                        .font(.title)
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                    
                    Text(String(eupoints))
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                }.padding()
                
                    
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
            recordText = "Best score:"
            partOfW = "Europe"
        } else {
            recordText = "bästa score:"
            partOfW = "Europa"
        }
    }
    
}

struct EuropeScore_Previews: PreviewProvider {
    static var previews: some View {
        EuropeScore()
    }
}

