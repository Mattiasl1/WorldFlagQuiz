//
//  ALTallquizView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-23.
//

import SwiftUI

struct ALTallquizView: View {
    var body: some View {
        ZStack{
            Color(.sRGB, red: 0.05, green: 0.6, blue: 0.3, opacity: 1)
                .ignoresSafeArea()
                
                VStack{
                    Text("Välj Quiz")
                        .foregroundColor(.white)
                        .padding()
                        .font(.largeTitle)
                        
                        Spacer()

                    NavigationLink(destination: AllQuiz())
 
                        
                    {Text("Världen")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 80)
                                .background(.gray)
                                .cornerRadius(10)
                                .border(Color.white, width: 4)
                        
                    }.padding()
                    Spacer()
    }
}
    }
}

struct ALTallquizView_Previews: PreviewProvider {
    static var previews: some View {
        ALTallquizView()
    }
}
