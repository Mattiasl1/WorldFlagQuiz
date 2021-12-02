//
//  BackgroundColor.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        ZStack{
            Color(.sRGB, red: 0.05, green: 0.6, blue: 0.3, opacity: 0.5)
                .ignoresSafeArea()
            
            /*
             Color("MyBlue")
                 .ignoresSafeArea()
             */
        }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColor()
    }
}
}
