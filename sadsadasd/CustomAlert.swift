//
//  CustomAlert.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2021-12-20.
//

import SwiftUI

struct CustomAlert: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("H")
                    
            }
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert()
    }
}
