//
//  AltasiaView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-23.
//

import SwiftUI

struct AltasiaView: View {
    var body: some View {
        ZStack{
            Color(.sRGB, red: 1, green: 0.3, blue: 0.2, opacity: 1)
                .ignoresSafeArea()
                
                VStack{
                    Text("Välj Quiz")
                        .foregroundColor(.white)
                        .padding()
                        .font(.largeTitle)
                        
                        Spacer()

                    NavigationLink(destination: AsiaQuiz())
 
                        
                    {Text("Asien")
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

struct AltasiaView_Previews: PreviewProvider {
    static var previews: some View {
        AltasiaView()
    }
}
