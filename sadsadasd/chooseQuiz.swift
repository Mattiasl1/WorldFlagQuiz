//
//  chooseQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation





struct chooseQuiz: View {
    
    @State var bildbild = "star"
    @State var EU = "Europa"
    @State var AS = "Asien"
    @State var AF = "afrika"
    @State var AM = "Amerika"
    @State var VN = "Världen"
    
    
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
                        
                        HStack{
                            Text("Premium:")
                                .foregroundColor(.white)
                                .padding(.leading)
                                .font(.title)
                            Image(systemName: bildbild)
                                .font(.title)
                                .foregroundColor(.yellow)
                            Spacer()
                            Button(action: {
                                bildbild = "star.fill"
                                
                            }) {
                                Text("Bli Premium")
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 40)
                                    .background(.mint)
                                    .padding(.horizontal)
                                    
                                    
                            }
                        }
                        
                        
                        
                        Spacer()
                        
                        
                        NavigationLink(destination: EuropeQuiz())
     
                            
                        {Text(EU)
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
                        
                        NavigationLink(destination: AsiaQuiz()) {Text(AS)
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
                        
                        NavigationLink(destination: AfricaQuiz()) {Text(AF)
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
                        
                        NavigationLink(destination: AmericaQuiz()) {Text(AM)
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
                        
                        NavigationLink(destination: AllQuiz()) {Text(VN)
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
    


struct chooseQuiz_Previews: PreviewProvider {
    static var previews: some View {
        chooseQuiz()
    }
}
