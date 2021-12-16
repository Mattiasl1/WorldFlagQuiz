//
//  AltChooseView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-12-10.
//

import SwiftUI

struct AltChooseView: View {
    
    @State private var open = false
    @State var EU = "Europa"
    @State var AS = "Asien"
    @State var AF = "Afrika"
    @State var AM = "Amerika"
    @State var ALL = "Världen"
    
    var body: some View {
        
        
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    
                  
                    
                    Button(action: {
                        self.open.toggle()
                    }) {
                        Image(systemName: "globe.europe.africa.fill")
                            .rotationEffect(.degrees(open ? 90 : 0))
                            .foregroundColor(.white)
                            .font(.system(size: 80, weight: .bold))
                            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    }
                    .padding(5)
                    .background(Color("MyBlue"))
                    .mask(Circle())
                    .shadow(color: Color.black, radius: 10)
                    .zIndex(10)
                    
                    SecondButton(open: $open, text: ALL, color: .blue, offsetY: -130, delay: 0.1)
                    
                    
                    SecondButton2(open: $open, text: EU, color: .green, offsetX: 0, offsetY: -250, delay: 0.2)
                        
                        
                    
                    SecondButton(open: $open, text: AS, color: .purple, offsetX: 0, offsetY: -370, delay: 0.3)
                    
                    SecondButton4(open: $open, text: AF, color: .orange, offsetX: 0, offsetY: -490, delay: 0.4)
                    
                    SecondButton5(open: $open, text: AM, color: .red, offsetX: 0, offsetY: -610, delay: 0.5)
                    
                    
                    
                    
                }
                
            }/*
              .purple, offsetX: 90, offsetY: 125, delay: 0.8)
              */
        }.onAppear(perform: doLang)
        
    }
    
    func doLang()
    {
        var lang = UserDefaults.standard.string(forKey: "lang")
        if(lang == nil)
        {
            UserDefaults.standard.set("en", forKey: "lang")
            lang = "en"
        }
        
        if(lang == "en")
        {
            EU = "Europe"
            AS = "Asia"
            AF = "Africa"
            AM = "America"
            ALL = "World"
            
        } else {
            EU = "Europa"
            AS = "Asien"
            AF = "Afrika"
            AM = "Amerika"
            ALL = "Världen"
           
        }
    }
    
}

struct AltChooseView_Previews: PreviewProvider {
    static var previews: some View {
        AltChooseView()
    }
}


struct SecondButton: View {
    @Binding var open: Bool
    let text : String
    var icon    = ""
    var color   = Color.blue
    var offsetX = 0
    var offsetY = 0
    var delay   = 0.0
    @State private var isPresented = false
    
    var body: some View {
        Button(action: { 
            
        }) {
            
            Text(text)
                .fontWeight(.semibold)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
        }.frame(width: 300, height: 70)
        .padding(5)
        .background(color)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .cornerRadius(30)
        .padding(.bottom, 10.0)
        .shadow(color: .black, radius: 4, x: 0, y: 0)
        .font(.system(size: 40))
        .offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
        .scaleEffect(open ? 1 : 0)
        .animation(Animation.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0).delay(Double(delay)))
        .shadow(color: .black, radius: 2, x: 0, y: 0)
    }

}


struct SecondButton2: View {
    @Binding var open: Bool
    let text : String
    var icon    = ""
    var color   = Color.blue
    var offsetX = 0
    var offsetY = 0
    var delay   = 0.0
    @State private var isPresented = false
    
    var body: some View {
        
        
        NavigationLink(destination: EuropeQuiz())
            {
                Text(text)
                .fontWeight(.semibold)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
        }
         .frame(width: 300, height: 70)
            
        .padding(5)
        .background(color)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .cornerRadius(30)
        .padding(.bottom, 10.0)
        .shadow(color: .black, radius: 4, x: 0, y: 0)
        .font(.system(size: 40))
        .offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
        .scaleEffect(open ? 1 : 0)
        .animation(Animation.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0).delay(Double(delay)))
        .shadow(color: .black, radius: 2, x: 0, y: 0)
        
    }
    
    
    

}


struct SecondButton3: View {
    @Binding var open: Bool
    let text : String
    var icon    = ""
    var color   = Color.blue
    var offsetX = 0
    var offsetY = 0
    var delay   = 0.0
    @State private var isPresented = false
    @State private var isPresenting = false
    
    var body: some View {
    
        Button("Världen") {
            isPresenting.toggle()
        }
        .fullScreenCover(isPresented: $isPresenting, content: AllQuiz.init)
        
        
    }
    
}
struct SecondButton4: View {
    @Binding var open: Bool
    let text : String
    var icon    = ""
    var color   = Color.blue
    var offsetX = 0
    var offsetY = 0
    var delay   = 0.0
    @State private var isPresented = false
    
    var body: some View {
        NavigationLink(destination: AfricaQuiz())
            
            {Text(text)
                .fontWeight(.semibold)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
        }.frame(width: 300, height: 70)
            
        .padding(5)
        .background(color)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .cornerRadius(30)
        .padding(.bottom, 10.0)
        .shadow(color: .black, radius: 4, x: 0, y: 0)
        .font(.system(size: 40))
        .offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
        .scaleEffect(open ? 1 : 0)
        .animation(Animation.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0).delay(Double(delay)))
        .shadow(color: .black, radius: 2, x: 0, y: 0)
    }
    
    
    

}

struct SecondButton5: View {
    @Binding var open: Bool
    let text : String
    var icon    = ""
    var color   = Color.blue
    var offsetX = 0
    var offsetY = 0
    var delay   = 0.0
    @State private var isPresented = false
    
    var body: some View {
        NavigationLink(destination: AmericaQuiz())
            
            {Text(text)
                .fontWeight(.semibold)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
        }.frame(width: 300, height: 70)
            
        .padding(5)
        .background(color)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .cornerRadius(30)
        .padding(.bottom, 10.0)
        .shadow(color: .black, radius: 4, x: 0, y: 0)
        .font(.system(size: 40))
        .offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
        .scaleEffect(open ? 1 : 0)
        .animation(Animation.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0).delay(Double(delay)))
        .shadow(color: .black, radius: 2, x: 0, y: 0)
    }
    
    
    

}



/*
 Image(systemName: icon)
     .foregroundColor(.white)
     .font(.system(size: 50, weight: .bold))
 */
