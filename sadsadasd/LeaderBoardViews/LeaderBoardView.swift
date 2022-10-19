//
//  LeaderBoardView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-22.
//

import SwiftUI
import Firebase

struct LeaderBoardView: View {
    
    
    
    
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.white, .white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            
        TabView {
            AllworldScore()
            EuropeScore()
            AsiaScore()
            AfricaScore()
            AmericaScore()
            
                }
        
        .tabViewStyle(.page(indexDisplayMode: .automatic))
                .ignoresSafeArea()
                
            
                
        }.onAppear(perform: {
            Analytics.logEvent(AnalyticsEventScreenView,
                               parameters: [AnalyticsParameterScreenName: "Highscore"])
        })
        
    }
    
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
