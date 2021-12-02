//
//  AfricaScore.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct AfricaScore: View {
    @State var africapoints = UserDefaults.standard.integer(forKey: "africa")
    
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
                    .shadow(color: .black, radius: 13, x: 0, y: 0)
                Spacer()
                //gamescoreEU
                
                Text(String(africapoints))
                    .font(.system(size: 120))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(color: .yellow, radius: 13, x: 0, y: 0)
                
                
                Spacer()
                Text("AFRIKA")
                    .font(.system(size: 80))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .underline(true, color: .yellow)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                Spacer()
            }
            
        }
    }
}

struct AfricaScore_Previews: PreviewProvider {
    static var previews: some View {
        AfricaScore()
    }
}
