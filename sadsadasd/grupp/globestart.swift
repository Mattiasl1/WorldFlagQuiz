//
//  globestart.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-16.
//

import SwiftUI

struct globestart: View {
    var body: some View {
        Image("globe")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 280, height: 280)
            
            
    }
}

struct globestart_Previews: PreviewProvider {
    static var previews: some View {
        globestart()
            .previewLayout(.sizeThatFits)
    }
}
