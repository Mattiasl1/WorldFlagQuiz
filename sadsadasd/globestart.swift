//
//  globestart.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-16.
//

import SwiftUI

/*
 Image("MyGlobe")
     .resizable(resizingMode: .stretch)
     .aspectRatio(contentMode: .fit)
 */

struct globestart: View {
    var body: some View {
        Image("testworldmap")
            .resizable(resizingMode: .stretch)
            .frame(maxWidth: .infinity, minHeight: 150, idealHeight: 200, maxHeight: 200, alignment: .center)
            .aspectRatio(contentMode: .fit)
        
            
            
    }
}

struct globestart_Previews: PreviewProvider {
    static var previews: some View {
        globestart()
            .previewLayout(.sizeThatFits)
    }
}
