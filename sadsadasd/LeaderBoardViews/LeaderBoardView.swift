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
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
          //  LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
            //    .edgesIgnoringSafeArea(.all)
            
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
