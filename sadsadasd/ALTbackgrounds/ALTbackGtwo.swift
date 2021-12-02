//
//  ALTbackGtwo.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-25.
//

import SwiftUI

struct ALTbackGtwo: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                
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
                                .frame(width: 280, height: 60)
                                .background(.gray)
                                .cornerRadius(10)
                                .border(Color.white, width: 2)
                        
                    }
                    
                    .padding()
                    
                    NavigationLink(destination: AsiaQuiz()) {Text("Asien")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 280, height: 60)
                                .background(.gray)
                                .cornerRadius(10)
                                .border(Color.white, width: 2)
                                
                    }
                    .padding()
                    
                    NavigationLink(destination: AfricaQuiz()) {Text("Afrika")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 280, height: 60)
                                .background(.gray)
                                .cornerRadius(10)
                                .border(Color.white, width: 2)
                    }
                    .padding()
                    
                    NavigationLink(destination: AmericaQuiz()) {Text("Amerika")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .foregroundColor(.white)
                                .frame(width: 280, height: 60)
                                .background(.gray)
                                .cornerRadius(10)
                                .border(Color.white, width: 2)
                                
                    }
                    .padding()
                    
                    NavigationLink(destination: AllQuiz()) {Text("Världen")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding(.all)
                                .foregroundColor(.white)
                                .frame(width: 280, height: 60)
                                .background(.gray)
                                .cornerRadius(10)
                                .border(Color.white, width: 2)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
        }
    }
    }

struct ALTbackGtwo_Previews: PreviewProvider {
    static var previews: some View {
        ALTbackGtwo()
    }
}
