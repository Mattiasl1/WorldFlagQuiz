//
//  LeaderBoardView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-22.
//

import SwiftUI

struct LeaderBoardView: View {
    
    
    
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
        TabView {
            EuropeScore()
            AsiaScore()
            AfricaScore()
            AmericaScore()
            AllworldScore()
                }
        
        .tabViewStyle(.page(indexDisplayMode: .automatic))
                .ignoresSafeArea()
                .background(.black)
            
                
        }
        
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
