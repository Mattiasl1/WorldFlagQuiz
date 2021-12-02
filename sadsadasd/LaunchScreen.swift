//
//  LaunchScreen.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-25.
//

import SwiftUI


struct EuropeLaunchImageQuiz: View {
    // Properties
    var imageName: String

    var body: some View {
        // View Code
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 50, height: 50)
            
    }
}


struct LaunchScreen: View {
    
    @State private var correctIndexAnswer = 0
    @State private var CountryName = ["Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Skottland", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Wales", "Österrike"].shuffled()
    
    
    
    var body: some View {
        
        HStack{
        EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
            .frame(width: 50, height: 50)
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                .frame(width: 50, height: 50)
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                .frame(width: 50, height: 50)
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                .frame(width: 50, height: 50)
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                .frame(width: 50, height: 50)
            
        }
        
        
    }
    
    
    func askQuestion() {
        CountryName.shuffle()
        correctIndexAnswer = Int.random(in: 0...2)
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
}
