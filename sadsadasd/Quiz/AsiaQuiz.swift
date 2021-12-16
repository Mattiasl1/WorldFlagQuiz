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
            .frame(width: 320, height: 200)
            .shadow(color: .black, radius: 10, x: 0, y: 0)
    }
}

struct AsiaQuiz: View {
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    @State private var TimeToStart = 3
    let Starttimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var RoundTimer = 32
    let RoundtimerCounter = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreAS = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
    
    @State private var CountryNameEN = ["Armenia", "Azerbaijan", "Cambodia", "China", "Cyprus", "India", "Indonesia", "Iraq", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Kyrgyzstan", "Lebanon", "Maldives", "Mongolia", "Nepal", "United arab Emirates", "Israel", "Laos", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines", "Saudi Arabia", "South Korea", "Syria", "Tajikistan", "Thailand", "Taiwan", "Timor-Leste", "Turkey", "Singapore", "Qatar", "Uzbekistan", "Vietnam", "Yemen"].shuffled()
   
    @State private var CountryName = ["Afghanistan", "Armenien", "Azerbajdzjan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cypern", "Filippinerna", "F Arabemiraten", "Indien", "Indonesien", "Irak", "Iran", "Israel", "Japan", "Jemen", "Jordanien", "Kambodja", "Kazakstan", "Kina", "Kirgizistan", "Kuwait", "Laos", "Libanon", "Malaysia", "Maldiverna", "Mongoliet", "Myanmar", "Nepal", "Nordkorea", "Oman", "Pakistan", "Qatar", "Saudiarabien", "Singapore", "Sri Lanka", "Palestina", "Sydkorea", "Syrien", "Tadzjikistan", "Taiwan", "Thailand", "Turkiet", "Turkmenistan", "Uzbekistan", "Vietnam", "Östtimor"].shuffled()
    
    @State private var showASscore : Int = 0
    @State var showCorrect = false
    @State var AsiaLang = "Quiz Asia"
    @State var playAgain = "Play again"
    @State var StartRound = false
    @State var Countdown : Int = 3
    @State private var showendOfGameAlert = false
    @State var endOfTextENG = "Total points!"
    @State var isVisible = false
    @State var gameRoundTimer : Int = 30
    @State var StartGameTimer = false
    @State var endroundtimeout = false
    @State var minusTime = -200
    @State var plusTime = +1
    @State var showWrong = false
    @State var isNavigationBarHidden: Bool = true
    @State var animationAmount = 1.0
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        VStack {
            
            if (StartRound) {
                Text(AsiaLang)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
            }
            
            if(StartGameTimer) {
                Text("Timeleft: \(RoundTimer)")
                    .foregroundColor(Color.white).font(.title2).shadow(color: .black, radius: 6, x: 0, y: 0)
              
            }
            
            
            EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                
            
            //timerview()
            HStack {
                Text("Score:")
                    .fontWeight(.bold)
                    .font(.title)

                Text("\(String(gameScoreAS))")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            
            
            
            .alert(endOfGameText, isPresented: $showendOfGameAlert) {
                Button(playAgain, role: .cancel) {
                    let oldscore = UserDefaults.standard.integer(forKey: "asia")
                    
                    if(gameScoreAS > oldscore)
                    {
                        UserDefaults.standard.set(gameScoreAS, forKey: "asia")
                        
                    }
                    
                    self.resetGame()
                }
            }
            /*
             .alert(isPresented: $endOfGame) {
                 Alert(title: Text(endOfGameText), message: Text("You got a total of \(gameScoreAS) points!"), dismissButton: .default(Text(playAgain)) {
                     
                     // Spara poäng
                     let oldscore = UserDefaults.standard.integer(forKey: "asia")
                     
                     if(gameScoreAS > oldscore)
                     {
                         UserDefaults.standard.set(gameScoreAS, forKey: "asia")
                     }
                     
                     self.resetGame()
                 })
             }
             */
            Text("Points: \(timeRemaining)")
                .padding()
            .font(.title2)
            
            
            
            
            
            
            ForEach(0 ..< 3) { number in
                Button(action: {
                    self.CountryTapped(number)
                    AudioServicesPlaySystemSound(1306)
                }) {
                    Text(self.CountryName[number])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .foregroundColor(.white)
                        
                        .frame(width: 350, height: 70)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 5)
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 10.0)
                        .shadow(color: .black, radius: 4, x: 0, y: 0)
                    
                }
                
            }
            
           
        }
            
            if(StartRound)
            {
                Text((String(Countdown))).fontWeight(.bold).foregroundColor(Color.white).font(.system(size: 250))
                    .opacity(isVisible ? 1 : 0.8)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                    .scaleEffect(isVisible ? 1.4 : 0.4)
                    .onAppear {
                        withAnimation(.spring(response: 1, dampingFraction: 0.1, blendDuration: 0)) {
                            self.isVisible.toggle()
                        }
                    }
                    
                    
            }
            
            
            if(showCorrect)
            {
                VStack{
                Text("+\(String(showASscore))").fontWeight(.bold).opacity(1).foregroundColor(Color.white).font(.system(size: 80))
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                    
                }
                
            } else if(showWrong)
            {
                
                Text("Score  \(String(minusTime))").fontWeight(.bold).opacity(1).foregroundColor(Color.red).font(.system(size: 40)
                                                                                                                    
                )}
        
            
            
            
        }.onAppear(perform: {
            doLang()
            StartRound.toggle()
            CountToStart()
            animationAmount = 1
            
            self.isNavigationBarHidden = true
            
            
        })
        
        
        .onReceive(timer) { time in
            if endOfGame == false {
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    
                }
            }
            
        }
        
        .onReceive(Starttimer) { time in
            if self.Countdown > 0 {
                self.Countdown -= 1
                
            }
            
        }
        
        .onReceive(RoundtimerCounter) { time in
            if RoundTimer == 0  {
                
                gameOver()
                endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreAS))")
                gameOver()
            }else if self.RoundTimer > 0 {
                self.RoundTimer -= 1
            }
            
        }
    }
    func CountryTapped(_ number: Int) {
        
         
         
        
        if number == correctIndexAnswer {
            gameScoreAS =  timeRemaining + gameScoreAS
            showASscore = timeRemaining
            RoundTimer = RoundTimer + 1
            
            
            
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showCorrect = false
                self.askQuestion()
                timeRemaining = 300
            }
            
            
            
            
            
            
        } else if number != correctIndexAnswer {
            gameScoreAS = gameScoreAS - 200
            showWrong = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showWrong = false
            }
            if gameScoreAS < 1 {
                gameScoreAS = 0
            }
            
            /*
             endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreEU))")
             gameOver()
             */
        } else if gameRoundTimer < 1 {
            endroundtimeout.toggle()
        }
        
    }

    func askQuestion() {
        CountryName.shuffle()
        correctIndexAnswer = Int.random(in: 0...2)
    }

    func gameOver() {
        endOfGame = true
        showendOfGameAlert = true
    }

    func wrongAnswer() {
        showingScore = true
    }

    func resetGame() {
        endOfGame = false
        gameScoreAS = 0
        RoundTimer = 30
        askQuestion()
        timeRemaining = 300
    }
    
    func timeRunOut() {
        if timeRemaining == 0{
            endOfGame = true
        }
    }
    
    func doLang()
    {
        var lang = UserDefaults.standard.string(forKey: "lang")
        if(lang == nil)
        {
            UserDefaults.standard.set("en", forKey: "lang")
            lang = "en"
        }
        
        if(lang == "en")
        {
            CountryName = CountryNameEN
            AsiaLang = "Quiz Asia"
            playAgain = "Play again"
            endOfTextENG = "Total points: "
            
        } else {
            CountryName = CountryName
            AsiaLang = "Quiz Asien"
            playAgain = "Spela igen"
            endOfTextENG = "Totala poäng: "
           
        }
    }
    
    
    func CountToStart() {
        
        if StartRound == true {
            timeRemaining = 0
            StartRound = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                
                StartRound = false
                
                timeRemaining = 300
                StartGameTimer.toggle()
                
            }
        }
        
    }
    
}

struct AsiaQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AsiaQuiz()
    }
}
