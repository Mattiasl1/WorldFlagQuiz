//
//  ChooseQuizALT.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-23.
//

import SwiftUI

struct ChooseQuizALT: View {
    var body: some View {
        
        ZStack{
            
        TabView {
            ALTeuropeView()
            AltasiaView()
            ALTafricaView()
            ALTamericaView()
            ALTallquizView()
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
                .background(.black)
        }
            }
        }
    


struct ChooseQuizALT_Previews: PreviewProvider {
    static var previews: some View {
        ChooseQuizALT()
    }
}
