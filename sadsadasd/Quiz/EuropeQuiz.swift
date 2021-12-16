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
            .frame(width: 320, height: 200)
            .shadow(color: .black, radius: 10, x: 0, y: 0)
        
    }
}


/*
 .frame(width: 320, height: 200)
 .resizable(resizingMode: .stretch)
 .aspectRatio(contentMode: .fit)
 */


struct EuropeQuiz: View {
    
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    
    @State private var TimeToStart = 3
    let Starttimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var RoundTimer = 32
    let RoundtimerCounter = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var EuropeScore : Int = 0
    
    @State var buttonFlash: Bool = false
    @State var ShowHighScore = false
    @State var showOther = false
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreEU : Int = 0
    @State private var showEuscore : Int = 0
    //@AppStorage("gameScoreEU") private var gameScoreEU = 0
    
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
    @State private var showendOfGameAlert = false
    
    @State private var CountryNameEN = ["Albania", "Andorra", "Austria", "Belarus", "Belgium", "Bosnia", "Bulgaria", "Croatia", "Czechia", "Denmark", "Estonia", "France", "Finland", "Germany", "Greece", "Iceland", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Moldova", "Netherlands", "North Macedonia", "Norway", "Liechtenstein", "Malta", "Monaco", "Montenegro", "Poland", "Portugal", "Romania", "Russia", "SanMarino", "Schweiz", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Ukraine", "Hungary", "United Kingdom", "Vatican City"].shuffled()
    
    
    @State private var CountryName = ["Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Österrike"].shuffled()
    
    
    @State var showCorrect = false
    @State var showWrong = false
    
    @State var youGot = "Du fick totalt"
    @State var points = "poäng!"
    @State var playAgain = "Play again!"
    @State var extraPoints = "Points"
    @State var europeLang = "Quiz Europe"
    @State var StartRound = false
    @State var Countdown : Int = 3
    @State var endOfTextENG = "Total points!"
    @State var isVisible = false
    @State var isNavigationBarHidden: Bool = true
    @State var animationAmount = 1.0
    @State var gameRoundTimer : Int = 30
    @State var StartGameTimer = false
    @State var endroundtimeout = false
    @State var minusTime = -200
    @State var plusTime = +1
    
    
    
    // animation
    
    
    
    var body: some View {
        
        
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                if (StartRound) {
                    Text(europeLang)
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
                    
                    Text("\(String(gameScoreEU))")
                        .fontWeight(.bold)
                        .font(.title)
                }
                
                
                
                .alert(endOfGameText, isPresented: $showendOfGameAlert) {
                    Button(playAgain, role: .cancel) {
                        let oldscore = UserDefaults.standard.integer(forKey: "europe")
                        
                        if(gameScoreEU > oldscore)
                        {
                            UserDefaults.standard.set(gameScoreEU, forKey: "europe")
                            
                        }
                        
                        self.resetGame()
                    }
                }
                
                
                
                HStack {
                    Text("Points: \(timeRemaining)")
                        .padding()
                        .font(.title2)
                    
                    
                }
                
                
                
                
                
                
                
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.CountryTapped(number)
                        AudioServicesPlaySystemSound(1306)
                        
                        
                    })
                    {
                        Text(self.CountryName[number])
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 70)
                            .background(Color.green)
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
            
            /*
             if(showCorrect) {
                 Text("Timeleft  +\(String(plusTime))").fontWeight(.bold).opacity(1).foregroundColor(Color.green).font(.system(size: 40)
                                                                                                                     
                 )
             */
            
            
            if(showCorrect)
            {
                VStack{
                Text("+\(String(showEuscore))").fontWeight(.bold).opacity(1).foregroundColor(Color.white).font(.system(size: 80))
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                    
                }
                
            } else if(showWrong)
            {
                
                Text("Score  \(String(minusTime))").fontWeight(.bold).opacity(1).foregroundColor(Color.red).font(.system(size: 40)
                                                                                                                    
                )}
            
            
            
            
        }
        .onAppear(perform: {
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
                endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreEU))")
                gameOver()
            }else if self.RoundTimer > 0 {
                self.RoundTimer -= 1
            }
            
        }
        
    }
    func CountryTapped(_ number: Int) {
        
         
         
        
        if number == correctIndexAnswer {
            gameScoreEU =  timeRemaining + gameScoreEU
            showEuscore = timeRemaining
            RoundTimer = RoundTimer + 1
            
            
            
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showCorrect = false
                self.askQuestion()
                timeRemaining = 300
            }
            
            
            
            
            
            
        } else if number != correctIndexAnswer {
            gameScoreEU = gameScoreEU - 200
            showWrong = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showWrong = false
            }
            if gameScoreEU < 1 {
                gameScoreEU = 0
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
        gameScoreEU = 0
        RoundTimer = 30
        askQuestion()
        timeRemaining = 300
    }
    
    
    
    func highscorepoint() {
        showEuscore = 10 + timeRemaining
    }
    
    func playMore() {
        resetGame()
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
            europeLang = "Quiz Europe"
            playAgain = "Play again"
            endOfTextENG = "Total points: "
            
        } else {
            CountryName = CountryName
            europeLang = "Quiz Europa"
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
    
    func gametimeleft() {
        if RoundTimer == 0 {
            gameOver()
        }
    }
    
}












struct EuropeQuiz_Previews: PreviewProvider {
    static var previews: some View {
        EuropeQuiz()
            .previewLayout(.sizeThatFits)
    }
}





