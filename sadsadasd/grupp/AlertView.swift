//
//  AlertView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-19.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        ZStack {
            
            
            
            
            VStack{
                
                //Image("").resizable().frame(width: 200, height: 200)
                Spacer()
                VStack{
                Text("Game over!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                    
                    Text("Du fick 120 poäng")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                    
                    
                }
                
                
                Spacer()
                Spacer()
                
                Button("Spela igen") {
                    
                    
                }
                .frame(width: 200, height: 60, alignment: .center)
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
                .font(.title)
                .cornerRadius(30)
                
                
                    
                
                    
                 /*
                  LinearGradient(gradient: Gradient(colors: [.gray, .blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                          .edgesIgnoringSafeArea(.all)
                  */
                Spacer()
                
            }.frame(width: UIScreen.main.bounds.width, height: 400, alignment: .center)
                .border(.black)
                .background(.linearGradient(colors: [.green], startPoint: .bottomLeading, endPoint: .topTrailing))
                .opacity(1)
                                .ignoresSafeArea()
                .cornerRadius(30)
                .hoverEffect(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            
                
        }
        
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
            .previewLayout(.sizeThatFits)
    }
}
