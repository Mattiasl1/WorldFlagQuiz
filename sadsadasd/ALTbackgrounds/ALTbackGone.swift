//
//  ALTbackGone.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-25.
//

import SwiftUI

struct ALTbackGone: View {
    
    var body: some View {
        ZStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.black, .red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
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
                                    .foregroundColor(.black)
                                    .frame(width: 280, height: 60)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                            
                        }
                        
                        .padding()
                        
                        NavigationLink(destination: AsiaQuiz()) {Text("Asien")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.black)
                                    .frame(width: 280, height: 60)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                                    
                        }
                        .padding()
                        
                        NavigationLink(destination: AfricaQuiz()) {Text("Afrika")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.black)
                                    .frame(width: 280, height: 60)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                        }
                        .padding()
                        
                        NavigationLink(destination: AmericaQuiz()) {Text("Amerika")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.black)
                                    .frame(width: 280, height: 60)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                                    
                        }
                        .padding()
                        
                        NavigationLink(destination: AllQuiz()) {Text("Världen")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.black)
                                    .frame(width: 280, height: 60)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
            }
        }
        }


struct ALTbackGone_Previews: PreviewProvider {
    static var previews: some View {
        ALTbackGone()
    }
}
}
