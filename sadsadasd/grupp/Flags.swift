//
//  Flags.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-16.
//

import SwiftUI

struct Flags: View {
    @State var countries = ["dk", "br", "bo"].shuffled()
    
    var body: some View {
        
        
        Image("SWEDEN")
            .resizable(resizingMode: .stretch)
            .padding(.all, 50)
            .frame(height: 300)
            .border(Color.black)
    }
}

struct Flags_Previews: PreviewProvider {
    static var previews: some View {
        Flags()
            .previewLayout(.sizeThatFits)
    }
}
