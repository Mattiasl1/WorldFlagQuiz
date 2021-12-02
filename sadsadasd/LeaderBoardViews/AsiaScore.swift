//
//  AsiaScore.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct AsiaScore: View {
    @State var asiapoints = UserDefaults.standard.integer(forKey: "asia")
    
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
                
                Text(String(asiapoints))
                    .font(.system(size: 120))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .shadow(radius: 10)

                
                
                Spacer()
                Text("ASIEN")
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

struct AsiaScore_Previews: PreviewProvider {
    static var previews: some View {
        AsiaScore()
    }
}
