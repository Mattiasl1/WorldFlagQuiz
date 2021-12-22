//
//  AlertViewOne.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-12-06.
//

import SwiftUI

struct AlertViewOne: View {
    
    
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 0) {
                
                Text("alert")
                    
                    .font(Font.system(size: 30, weight: .semibold))
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                    .padding()
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                    
                    .cornerRadius(80)
                Text("100")
                    .foregroundColor(.white)
                    .font(Font.system(size: 50))
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                    .padding()
                    
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Spela igen")
                        .foregroundColor(.white)
                        .font(Font.system(size: 30))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                        
                        
                        
                }
                
            }.frame(maxWidth: .infinity)
                .frame(height: 250, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [.orange, .red, .red]), startPoint: .topTrailing, endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all))
                .cornerRadius(80)
        }
    }
}

struct AlertViewOne_Previews: PreviewProvider {
    static var previews: some View {
        AlertViewOne()
    }
}

struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool

    // 1.
    init(isPresented: Bool, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        popup = content()
    }

    // 2.
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    // 3.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
