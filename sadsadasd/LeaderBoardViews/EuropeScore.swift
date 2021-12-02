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
    
    var body: some View {
        
        
       
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                Spacer()
                Text("Rekord")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Spacer()
                //gamescoreEU
                
                Text(String(eupoints))
                    .font(.system(size: 120))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                
                Spacer()
                Text("EUROPA")
                    .font(.system(size: 80))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .underline()
                    .shadow(radius: 10)
                    
                
                Spacer()
            }
            
        }
        
        
      
        
        
}
}

struct EuropeScore_Previews: PreviewProvider {
    static var previews: some View {
        EuropeScore()
    }
}

