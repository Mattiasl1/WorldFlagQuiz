//
//  ALTchooseviewButton.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct ALTchooseviewButton: View {
    var body: some View {
        
        
            
        
                
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Text("Välj Quiz")
                            .foregroundColor(.white)
                            .padding()
                            .font(.largeTitle)
                            
                            Spacer()
                        
                        
                        
                        
                        
                        NavigationLink(destination: ALTquizButtonView())
     
                            
                        {Text("Europa")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .frame(width: 280, height: 60)
                                    .background(Color("MyBlue"))
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                            
                        }
                        
                        .padding()
                        
                        NavigationLink(destination: AsiaQuiz()) {Text("Asien")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .frame(width: 280, height: 60)
                                    .background(Color("MyBlue"))
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                                    
                        }
                        .padding()
                        
                        NavigationLink(destination: AfricaQuiz()) {Text("Afrika")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .frame(width: 280, height: 60)
                                    .background(Color("MyBlue"))
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                        }
                        .padding()
                        
                        NavigationLink(destination: AmericaQuiz()) {Text("Amerika")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .frame(width: 280, height: 60)
                                    .background(Color("MyBlue"))
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                                    
                        }
                        .padding()
                        
                        NavigationLink(destination: AllQuiz()) {Text("Världen")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .frame(width: 280, height: 60)
                                    .background(Color("MyBlue"))
                                    .cornerRadius(10)
                                    .border(Color.black, width: 2)
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
            }
        }
        }

struct ALTchooseviewButton_Previews: PreviewProvider {
    static var previews: some View {
        ALTchooseviewButton()
    }
}
