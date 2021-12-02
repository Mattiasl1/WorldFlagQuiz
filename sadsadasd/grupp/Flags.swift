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
    /*
     Button(action: {
         onClick = true
     }) {
         Text(countryList)
             .font(.largeTitle)
             .fontWeight(.semibold)
             .padding()
             .foregroundColor(.white)
             .frame(width: 300, height: 70)
             .background(Color("MyBlue"))
             .overlay(
                 RoundedRectangle(cornerRadius: 30)
                     .stroke(Color.black, lineWidth: 5)
             )
             .cornerRadius(30)
     }.fullScreenCover(isPresented: $onClick) {
         CountryListView()
     }
     */
    
    
}

struct Flags_Previews: PreviewProvider {
    static var previews: some View {
        Flags()
            .previewLayout(.sizeThatFits)
    }
}
