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
    @State var lista = ["hej", "hej2", "hej3"]
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            
            VStack{
                Text(partOfW)
                    .font(MyFont.title24)
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
                    
                    Text(String(americapoints))
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
            partOfW = "America"
        } else {
            recordText = "Bästa score:"
            partOfW = "Amerika"
        }
    }
}

struct AmericaScore_Previews: PreviewProvider {
    static var previews: some View {
        AmericaScore()
    }
}
