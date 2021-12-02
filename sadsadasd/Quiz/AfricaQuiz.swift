//
//  AfricaQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI
import AVFoundation

struct AfricaImageQuiz: View {
    
    var imageName: String

    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 300, height: 225)
    }
}

struct AfricaQuiz: View {
    @State private var timeRemaining = 15
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreAF = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
   
    @State private var CountryName = ["Algeriet", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.Afrikanska republiken", "Djibouti", "Egypten", "Ekvatorialguinea", "Elfenbenskusten", "Eritrea", "Etiopien", "Gabon", "Gambia", "Ghana", "Guinea", "GuineaBissau", "Kamerun", "Kap Verde", "Kenya", "KongoBrazzaville", "KongoKinshasa", "Lesotho", "Liberia", "Libyen", "Madagaskar", "Malawi", "Mali", "Marocko", "Mauretanien", "Mauritius", "Moçambique", "Namibia", "Niger", "Nigeria", "Rwanda", "São Tomé och Príncipe", "Senegal", "Seychellerna", "Sierraleone", "Somalia", "Sudan", "Swaziland", "Sydafrika", "Sydsudan", "Tanzania", "Tchad", "Togo", "Tunisien", "Uganda", "Zambia", "Zimbabwe"].shuffled()
    
    @State var showCorrect = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        VStack {
            VStack{
            Text("Quiz Afrika")
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

                Text("\(String(gameScoreAF))")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            
            .padding()
            .alert(isPresented: $endOfGame) {
                Alert(title: Text(endOfGameText), message: Text("Du fick totalt \(gameScoreAF) poäng!"), dismissButton: .default(Text("Spela igen")) {
                    // Spara poäng
                    let oldscore = UserDefaults.standard.integer(forKey: "africa")
                    
                    if(gameScoreAF > oldscore)
                    {
                        UserDefaults.standard.set(gameScoreAF, forKey: "africa")
                        
                        
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
            gameScoreAF = 10 + timeRemaining + gameScoreAF
            currentRound += 1
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                timeRemaining = 15
                showCorrect = false
                self.askQuestion()
            }
        }
        
        else if number != correctIndexAnswer {
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
        gameScoreAF = 0
        currentRound = 1
        askQuestion()
    }
    
    func timeRunOut() {
        if timeRemaining == 0{
            endOfGame = true
        }
    }
    
    
}


struct AfricaQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AfricaQuiz()
    }
}
