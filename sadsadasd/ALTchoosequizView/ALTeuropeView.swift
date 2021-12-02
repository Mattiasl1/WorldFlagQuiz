//
//  ALTeuropeView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-23.
//

import SwiftUI


struct ALTeuropeView: View {
    var body: some View {
        
        ZStack{
            Color(.sRGB, red: 0.05, green: 0.2, blue: 0.5, opacity: 1)
                .ignoresSafeArea()
                
                VStack{
                    Text("Välj Quiz")
                        .foregroundColor(.white)
                        .padding()
                        .font(.largeTitle)
                        
                        Spacer()

                    NavigationLink(destination: EuropeQuiz())
 
                        
                    {Text("Europa")
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

struct ALTeuropeView_Previews: PreviewProvider {
    static var previews: some View {
        ALTeuropeView()
    }
}
    
