//
//  Globe.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-15.
//

import SwiftUI

struct Globe: View {
    var body: some View {
        Image(systemName:("globe.europe.africa"))
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fill)
            .foregroundColor(Color(hue: 0.596, saturation: 1, brightness: 0.8))
            .frame(width: 300.0, height: 300.0)
    }
}

struct Globe_Previews: PreviewProvider {
    static var previews: some View {
        Globe()
            .previewLayout(.sizeThatFits)
    }
}
