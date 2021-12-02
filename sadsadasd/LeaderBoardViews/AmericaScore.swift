//
//  AmericaScore.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct AmericaScore: View {
    
    @State var americapoints = UserDefaults.standard.integer(forKey: "america")
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                Spacer()
                //gamescoreAM
                Text("Rekord")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Spacer()
                
                
                Text(String(americapoints))
                    .font(.system(size: 120))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                Spacer()
                Text("AMERIKA")
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

struct AmericaScore_Previews: PreviewProvider {
    static var previews: some View {
        AmericaScore()
    }
}