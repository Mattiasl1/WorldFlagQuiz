//
//  chooseQuizENG.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-28.
//

import SwiftUI

struct chooseQuizENG: View {
    var body: some View {
        
            
            
                    
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                        
                        VStack{
                            Text("Choose Quiz")
                                .foregroundColor(.white)
                                .padding()
                                .font(.largeTitle)
                                
                                Spacer()
                            
                            
                            
                            
                            
                            NavigationLink(destination: EuropeQuiz())
         
                                
                            {Text("Europe")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.all)
                                        .foregroundColor(.white)
                                        .frame(width: 280, height: 60)
                                        .background(.gray)
                                        .cornerRadius(10)
                                        .border(Color.black, width: 2)
                                
                            }
                            
                            .padding()
                            
                            NavigationLink(destination: AsiaQuiz()) {Text("Asia")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.all)
                                        .foregroundColor(.white)
                                        .frame(width: 280, height: 60)
                                        .background(.gray)
                                        .cornerRadius(10)
                                        .border(Color.black, width: 2)
                                        
                            }
                            .padding()
                            
                            NavigationLink(destination: AfricaQuiz()) {Text("Africa")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.all)
                                        .foregroundColor(.white)
                                        .frame(width: 280, height: 60)
                                        .background(.gray)
                                        .cornerRadius(10)
                                        .border(Color.black, width: 2)
                            }
                            .padding()
                            
                            NavigationLink(destination: AmericaQuiz()) {Text("America")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.all)
                                        .foregroundColor(.white)
                                        .frame(width: 280, height: 60)
                                        .background(.gray)
                                        .cornerRadius(10)
                                        .border(Color.black, width: 2)
                                        
                            }
                            .padding()
                            
                            NavigationLink(destination: AllQuiz()) {Text("The World")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.all)
                                        .foregroundColor(.white)
                                        .frame(width: 280, height: 60)
                                        .background(.gray)
                                        .cornerRadius(10)
                                        .border(Color.black, width: 2)
                            }
                            .padding()
                            
                            Spacer()
                            
                        }
                }
            }
            }
        
struct chooseQuizENG_Previews: PreviewProvider {
    static var previews: some View {
        chooseQuizENG()
    }
}
