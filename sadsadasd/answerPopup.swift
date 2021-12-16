//
//  answerPopup.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-12-06.
//

import SwiftUI

struct answerPopup: View {
    var body: some View {
      
        ZStack{
            
            VStack{
            frame(width: 300, height: 300)
                .background(.green)
            Text("Rätt")
                .font(.title)
                .foregroundColor(.black)
            }
        }
}

struct answerPopup_Previews: PreviewProvider {
    static var previews: some View {
        answerPopup()
            .previewLayout(.sizeThatFits)
    }
}
}
