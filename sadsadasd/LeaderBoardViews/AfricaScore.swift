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
    @State var lista = ["hej", "hej2", "hej3"]
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            
            VStack{
                Text(partOfW)
                    .font(MyFont.title30)
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
                        .font(MyFont.title18)
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                    
                    Text(String(africapoints))
                        .font(.system(size: 20))
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
            partOfW = "Africa"
        } else {
            recordText = "Bästa score:"
            partOfW = "Afrika"
        }
    }
}

struct AfricaScore_Previews: PreviewProvider {
    static var previews: some View {
        AfricaScore()
    }
}
