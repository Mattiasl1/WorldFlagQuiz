//
//  AnswerButton.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-15.
//

import SwiftUI

struct AnswerButton: View {
    
    
    let text: String
    
    
    
    
    var body: some View {
        
        
        
            
        Button(action: {
            
        }) {
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.all)
                .foregroundColor(.white)
                .frame(width: 300, height: 60)
                .background(.gray)
                .cornerRadius(25)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                
                
            
            
   
                
            }

        
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(text: "")
            .previewLayout(.sizeThatFits)
    }
}
