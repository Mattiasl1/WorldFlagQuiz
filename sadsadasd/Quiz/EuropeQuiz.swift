//
//  EuropeQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation


struct EuropeImageQuiz: View {
    
    var imageName: String
    
    var body: some View {
        
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 250, height: 180)
        
    }
}

struct EuropeQuiz: View {
    
    @State private var timeRemaining = 15
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    @State private var EuropeScore : Int = 0
    
    @State var buttonFlash: Bool = false
    @State var ShowHighScore = false
    @State var showOther = false
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreEU : Int = 0
    //@AppStorage("gameScoreEU") private var gameScoreEU = 0
    
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
    
    @State private var CountryName = ["Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Skottland", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Österrike"].shuffled()
    
    @State var animationAmount = 1.0
    @State var showCorrect = false
    
    var body: some View {
        
        
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack{
                    Text("Quiz Europa")
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
                    
                    Text("\(String(gameScoreEU))")
                        .fontWeight(.bold)
                        .font(.title)
                }
                
                
                .padding()
                .alert(isPresented: $endOfGame) {
                    Alert(title: Text(endOfGameText), message: Text("Du fick totalt \(gameScoreEU) poäng!"), dismissButton: .default(Text("Spela igen")) {
                        
                        // Spara poäng
                        let oldscore = UserDefaults.standard.integer(forKey: "europe")
                        
                        if(gameScoreEU > oldscore)
                        {
                            UserDefaults.standard.set(gameScoreEU, forKey: "europe")
                            
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
                Text("RÄTT").background(Color.green).frame(width: 300, height: 200).font(.title)
                    
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
            gameScoreEU = 10 + timeRemaining + gameScoreEU
            
            currentRound += 1
            
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
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
        gameScoreEU = 0
        currentRound = 1
        askQuestion()
    }
    
    
    
    func highscorepoint() {
        
    }
    
    
    
    
    
}












struct EuropeQuiz_Previews: PreviewProvider {
    static var previews: some View {
        EuropeQuiz()
    }
}





