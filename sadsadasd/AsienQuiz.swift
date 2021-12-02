//
//  AsienQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI

struct AsienQuiz: View {
    // Properties
    var imageName: String

    var body: some View {
        // View Code
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 300, height: 225)
            
    }
}

struct AsienQuiz: View {
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScore = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
   
    @State private var CountryName = ["Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Skottland", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Wales", "Österrike"].shuffled()
    
    var body: some View {
        ZStack{
            Color(.sRGB, red: 0.6, green: 0.5, blue: 0.3, opacity: 0.3)
                .ignoresSafeArea()
        VStack {
            
            Text("Europa quiz")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
                .padding(.top, 40)
            
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .padding(.bottom, 20)
            Spacer()
            //timerview()
            HStack {
                Text("Score:")
                    .fontWeight(.bold)

                Text("\(String(gameScore))")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding()
            .alert(isPresented: $endOfGame) {
                Alert(title: Text(endOfGameText), message: Text("Your final score was \(gameScore)"), dismissButton: .default(Text("New Game")) {
                    self.resetGame()
                })
            }
            Spacer()
            Spacer()
            
            ForEach(0 ..< 3) { number in
                Button(action: {
                    self.CountryTapped(number)
                }) {
                    Text(self.CountryName[number])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.gray)
                        .cornerRadius(10)
                    
                }
                
            }
            
            Spacer()
        }
        
        
            
            
            
        }
        
    }
    func CountryTapped(_ number: Int) {
        if currentRound >= 30 {
            endOfGameText = "Game Over!"
            gameOver()
        }

        if number == correctIndexAnswer && currentRound >= 10 {
            gameScore += 10
            self.askQuestion()
        }else if number == correctIndexAnswer {
            gameScore += 10
            self.askQuestion()
            currentRound += 1
        } else if number != correctIndexAnswer && currentRound >= 10 {
            endOfGameText = "Game Over!"
            gameOver()
        }else {
        answerText = "Wrong"
        wrongAnswer()
        currentRound += 1
        }
    }

    func askQuestion() {
        CountryName.shuffle()
        correctIndexAnswer = Int.random(in: 0...2)
    }

    func gameOver() {
        endOfGame = true
    }

    func wrongAnswer() {
        showingScore = true
    }

    func resetGame() {
        gameScore = 0
        currentRound = 1
        askQuestion()
    }
}

struct AsienQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AsienQuiz()
    }
}
