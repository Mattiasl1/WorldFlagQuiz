//
//  testquizView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-25.
//

import SwiftUI
import AVFoundation

struct EuropeImageQuizTest: View {
    // Properties
    var imageName: String

    var body: some View {
        // View Code
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 250, height: 180)
            
    }
}

struct testquizView: View {
    
    @State private var timeRemaining = 12
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    @State var showHigh = false
    
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
            LinearGradient(gradient: Gradient(colors: [.black, .green, .gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
        VStack {
            VStack{
            Text("Quiz Europa")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
                .padding(.top, 40)
                Text("\(currentRound) / 60")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding()

            }
            
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                
            Spacer()
            //timerview()
            HStack {
                Text("Score:")
                    .fontWeight(.bold)
                    .font(.title)

                Text("\(String(gameScore))")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            
            .padding()
            .alert(isPresented: $endOfGame) {
                Alert(title: Text(endOfGameText), message: Text("Du fick totalt \(gameScore) poäng!"), dismissButton: .default(Text("Spela igen")) {
                    self.resetGame()
                        })
                    
            }
            Text("Extra poäng: \(timeRemaining)")
                .padding()
            
            
            
            Spacer()
            Spacer()
            
            
            
            ForEach(0 ..< 3) { number in
                Button(action: {
                    self.CountryTapped(number)
                    AudioServicesPlaySystemSound(1306)
                }) {
                    Text(self.CountryName[number])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(.yellow)
                        .cornerRadius(10)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                        .padding(.bottom, 30)
                    
                }
                
            }
            
            Spacer()
            Spacer()
        }
            
            
        
        
            
            
            
        }
        
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                
            }
        }
        
        
    }
    func CountryTapped(_ number: Int) {
        if currentRound >= 60 {
            endOfGameText = "Grattis!"
            gameOver()
        }
       

        if number == correctIndexAnswer {
            gameScore = 10 + timeRemaining + gameScore
            timeRemaining = 12
            currentRound += 1
            self.askQuestion()
            
        } else if number != correctIndexAnswer {
            endOfGameText = "Game Over!"
            gameOver()
            timeRemaining = 0
        }; if timeRemaining < 0 {
            endOfGameText = "Game Over!"
            gameOver()
        }
        if endOfGame == true {
            
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
    
    func timeRunOut() {
        if timeRemaining == 0{
            endOfGame = true
        }
    }
    
    
}

    








struct testquizView_Previews: PreviewProvider {
    static var previews: some View {
        EuropeQuiz()
    }
}




/*
 if currentRound >= 30 {
     endOfGameText = "Game Over!"
     gameOver()
 }
 else {
 answerText = "Wrong"
 wrongAnswer()
 
 }
 else if number == correctIndexAnswer {
     gameScore = 10 + timeRemaining + gameScore
     timeRemaining = 12
     self.askQuestion()
     currentRound += 1
 }
 
 
 */



/*
 Form {
     
     ForEach(0 ..< 3) { number in
         Button(action: {
             self.CountryTapped(number)
         }) {
             Text(self.CountryName[number])
                 .font(.largeTitle)
                 .fontWeight(.semibold)
                 .padding(.all)
                 .foregroundColor(.white)
                 .frame(width: 300, height: 60)
                 .background(.gray)
                 .cornerRadius(10)
                 Spacer()
             
                 
         }
         
     }
 }
 
 
 .padding(.vertical)
 */
