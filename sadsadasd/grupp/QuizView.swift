//
//  QuizView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-16.
//

import SwiftUI

/*
 Rätt svar = poäng, ny bild, nya svar och timer reset
 poäng = 10 + timeleft
 */

struct QuizView: View {
    
    @State var points = 10
    @State var score = 0
    @State var timeRemaining = 12
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack{
            Color(.sRGB, red: 0.6, green: 0.5, blue: 0.3, opacity: 0.3)
                .ignoresSafeArea()
        
        VStack{
            
            Text(String(score))
                .font(.largeTitle)
                .padding(.all)
            Spacer()
            Image("Sverige")
                Spacer()
            timerview()
            
            
            Spacer()
            Spacer()
            Button(action: {
                score = score + 10
                print("Button pressed")
                
                
            }) {
                
                Text("Sverige")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.all)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60)
                    .background(.gray)
                    .cornerRadius(10)
     
                }
            .padding(.all)
            
            AnswerButton(text: "Italien")
                .padding(.all)
            
            AnswerButton(text: "Danmark")
                .padding(.all)
            
            
          
        }
            Spacer()
            Spacer()
            Spacer()
            
        }
        
        
         
        
    
    }
    
    
    
    
    
    
    
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
