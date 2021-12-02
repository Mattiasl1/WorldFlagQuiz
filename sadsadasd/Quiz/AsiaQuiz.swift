//
//  AsiaQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI
import AVFoundation

struct AsiaImageQuiz: View {
    
    var imageName: String

    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 300, height: 225)
    }
}

struct AsiaQuiz: View {
    @State private var timeRemaining = 15
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreAS = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
   
    @State private var CountryName = ["Afghanistan", "Armenien", "Azerbajdzjan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cypern", "Filippinerna", "F Arabemiraten", "Indien", "Indonesien", "Irak", "Iran", "Israel", "Japan", "Jemen", "Jordanien", "Kambodja", "Kazakstan", "Kina", "Kirgizistan", "Kuwait", "Laos", "Libanon", "Malaysia", "Maldiverna", "Mongoliet", "Myanmar", "Nepal", "Nordkorea", "Oman", "Pakistan", "Qatar", "Saudiarabien", "Singapore", "Sri Lanka", "Sydkorea", "Syrien", "Tadzjikistan", "Taiwan", "Thailand", "Turkiet", "Turkmenistan", "Uzbekistan", "Vietnam", "Östtimor"].shuffled()
    
    
    @State var showCorrect = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        VStack {
            VStack{
            Text("Quiz Asien")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
                .padding(.top, 10)
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

                Text("\(String(gameScoreAS))")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            
            .padding()
            .alert(isPresented: $endOfGame) {
                Alert(title: Text(endOfGameText), message: Text("Du fick totalt \(gameScoreAS) poäng!"), dismissButton: .default(Text("Spela igen")) {
                    
                    // Spara poäng
                    let oldscore = UserDefaults.standard.integer(forKey: "asia")
                    
                    if(gameScoreAS > oldscore)
                    {
                        UserDefaults.standard.set(gameScoreAS, forKey: "asia")
                    }
                    
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
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("MyBlue"))
                        .cornerRadius(10)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        .padding(.bottom, 30)
                    
                }
                
            }
            
            Spacer()
            Spacer()
        }
            
            
            if(showCorrect)
            {
                Text("RÄTT SVAR").background(Color.green).frame(width: 300, height: 200).font(.largeTitle)
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
            gameScoreAS = 10 + timeRemaining + gameScoreAS
            
            currentRound += 1
            
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                timeRemaining = 15
                showCorrect = false
                self.askQuestion()
            }
            
        } else if number != correctIndexAnswer {
            endOfGameText = "Game Over!"
            gameOver()
            timeRemaining = 15
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
        gameScoreAS = 0
        currentRound = 1
        askQuestion()
    }
    
    func timeRunOut() {
        if timeRemaining == 0{
            endOfGame = true
        }
    }
    
    
}

struct AsiaQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AsiaQuiz()
    }
}
