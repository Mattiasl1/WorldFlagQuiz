//
//  ContentViewENG.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI
import AVFoundation



struct ContentViewENG: View {
    @State var letsPlay = "PLAY"
    @State var highScore = "HIGHSCORE"
  
    
    var body: some View {
        
        VStack {
            NavigationView{
                
            ZStack{
                Color(.white)
                    .ignoresSafeArea()
                
            VStack {
                HStack{
                    Button {
                        highScore = "TOPPLISTA"
                        letsPlay = "SPELA"
                        print("Now Swedish")
                        AudioServicesPlaySystemSound(1306)
                    } label: {
                        
                        Image("SWEliten").resizable()
                            .frame(width: 50, height: 40)
                            .padding(.leading, 67.0)
                            .brightness(0.1)
                            
                    }
                    Spacer()
                        
                    Button {
                        highScore = "HIGHSCORE"
                        letsPlay = "PLAY"
                        print("Now English")
                        AudioServicesPlaySystemSound(1306)
                    } label: {
                        Image("ENGliten").resizable()
                            .frame(width: 50, height: 40)
                            .padding(.trailing, 67.0)
                            .brightness(0.1)
                            
                    }
                    
                        
                }
                
                
                globestart()
                    .background(.black)
                    .padding(.all)
                    
                
                Spacer()
                Spacer()
                
                
                
                
                NavigationLink(destination: chooseQuiz())
                {
                    
                    
                        Text(letsPlay)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 60)
                            .background(Color("MyBlue"))
                            .cornerRadius(10)
                            .border(Color.black, width: 2)
                            
         
                }
                
                
                
                    Spacer()
                
                    
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    
                    Text(highScore)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.all)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 60)
                        .background(Color("MyBlue"))
                        .cornerRadius(10)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    
          
                    }
                Spacer()
                Spacer()
                
            }
            
            
            }
            }
           
            
        }
        
}
    
    
    
    
    
}

struct ContentViewENG_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewENG()
    }
}
