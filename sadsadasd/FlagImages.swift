//
//  FlagImages.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI

struct FlagImages: View {
    
    let number: Int
    let countri: [String]
    let action: (_ number: Int) -> Void
    
    
    var body: some View {
        Button(action: {
            (self.number)
        }) {
            Image(self.counts[number]).renderingMode(.original)
        }
        .clipShape(Capsule())
        .overlay(Capsule()
        .stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    
    }
}

struct FlagImages_Previews: PreviewProvider {
    static var previews: some View {
        FlagImages(number: <#Int#>, countries: <#[String]#>, action: <#(Int) -> Void#>)
    }
}
