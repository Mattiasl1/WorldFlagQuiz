//
//  AfricaQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI
import AVFoundation
import Firebase
import SpriteKit

struct AfricaImageQuiz: View {
    
    var imageName: String

    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 320, height: 200)
            .shadow(color: .black, radius: 10, x: 0, y: 0)
    }
}

struct AfricaQuiz: View {
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    @State private var TimeToStart = 3
    let Starttimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var RoundTimer = 32
    let RoundtimerCounter = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreAF = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
    @State var isVisible = false
    
    @State private var CountryNameEN = ["Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.African Republic", "Cameroon", "Djibouti", "Cape Verde", "Chad", "Comoros", "DR Congo", "Egypt", "Equatorial Guinea", "Eritrea", "Eswatini", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "GuineaBissau", "Ivory Coast", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria", "Republic of Congo", "Rwanda", "Sao Tome & Principe", "Senegal", "Seychelles", "SierraLeone", "Somalia", "South Africa", "South Sudan", "Sudan", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe"].shuffled()
   
    @State private var CountryName = ["Algeriet", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.Afrikanska republiken", "Djibouti", "Egypten", "Ekvatorialguinea", "Elfenbenskusten", "Eritrea", "Etiopien", "Gabon", "Gambia", "Ghana", "Guinea", "GuineaBissau", "Kamerun", "Kap Verde", "Kenya", "KongoBrazzaville", "KongoKinshasa", "Lesotho", "Liberia", "Libyen", "Madagaskar", "Malawi", "Mali", "Marocko", "Mauretanien", "Mauritius", "Moçambique", "Namibia", "Niger", "Nigeria", "Rwanda", "São Tomé och Príncipe", "Senegal", "Seychellerna", "Sierraleone", "Somalia", "Sudan", "Swaziland", "Sydafrika", "Sydsudan", "Tanzania", "Tchad", "Togo", "Tunisien", "Uganda", "Zambia", "Zimbabwe"].shuffled()
    
    
    @State private var showAFscore : Int = 0
    @State var showCorrect = false
    @State var AfricaLang = "Quiz Africa"
    @State var playAgain = "Play again"
    @State var StartRound = false
    @State var Countdown : Int = 3
    @State private var showendOfGameAlert = false
    @State var endOfTextENG = "Total points!"
    @State var gameRoundTimer : Int = 30
    @State var StartGameTimer = false
    @State var endroundtimeout = false
    @State var minusTime = -500
    @State var plusTime = +1
    @State var showWrong = false
    @State var isNavigationBarHidden: Bool = true
    @State var animationAmount = 1.0
    
    var body: some View {
        
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            /*
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            */
            
            VStack {
                
                if (StartRound) {
                    Text(AfricaLang)
                        .font(MyFont.title18)
                        .padding(.bottom, 5)
                        .foregroundColor(Color.black)
                        
                }
                
                if(StartGameTimer) {
                    Text("Time:  \(RoundTimer)")
                        .foregroundColor(Color.black).font(MyFont.title18)
                  
                }
                
                
               
                EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                    
                
                
                
                
                //timerview()
                HStack {
                    Text("Score:")
                        .foregroundColor(Color.black)
                        .font(MyFont.title18)
                    
                    Text("\(String(gameScoreAF))")
                        .foregroundColor(Color.black)
                        .font(MyFont.title18)
                }
                
                
                
                .alert(endOfGameText, isPresented: $showendOfGameAlert) {
                    Button(playAgain, role: .cancel) {
                        let oldscore = UserDefaults.standard.integer(forKey: "africa")
                        
                        if(gameScoreAF > oldscore)
                        {
                            UserDefaults.standard.set(gameScoreAF, forKey: "africa")
                            
                        }
                        
                        self.resetGame()
                    }
                }
                
                
                
                HStack {
                    Text("Points: \(timeRemaining)")
                        .padding()
                        .font(MyFont.title18)
                    
                    
                }
                
                
                
                
                
                
                
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.CountryTapped(number)
                        
                    })
                    {
                        Text(self.CountryName[number])
                            .font(MyFont.title18)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                            .background(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .cornerRadius(5)
                            .padding(.bottom, 10.0)
                            .shadow(color: .black, radius: 2, x: 0, y: 0)
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
            
            if(StartRound)
            {
                Text((String(Countdown))).fontWeight(.bold).foregroundColor(Color.white).font(.system(size: 120))
                    .opacity(isVisible ? 1 : 0.8)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
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
            
            ZStack{
            if(showCorrect)
            {
                
                    Text("+\(String(showAFscore))").fontWeight(.bold).opacity(1).foregroundColor(Color.green).font(MyFont.title50)
                    
                
                
            } else if(showWrong)
            {
                
                Text("  \(String(minusTime))").fontWeight(.bold).opacity(1).foregroundColor(Color.red).font(MyFont.title50)}
            
            }
            
            
        }
        .onAppear(perform: {
            doLang()
            StartRound.toggle()
            CountToStart()
            animationAmount = 1
            Analytics.logEvent(AnalyticsEventScreenView,
                               parameters: [AnalyticsParameterScreenName: "Africa quiz"])

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
                endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreAF))")
                gameOver()
            }else if self.RoundTimer > 0 {
                self.RoundTimer -= 1
            }
            
        }
        
        
    }
    func CountryTapped(_ number: Int) {
        
         
         
        
        if number == correctIndexAnswer {
            gameScoreAF =  timeRemaining + gameScoreAF
            showAFscore = timeRemaining
            RoundTimer = RoundTimer + 1
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showCorrect = false
                self.askQuestion()
                timeRemaining = 300
            }
            
            
            
            
            
            
        } else if number != correctIndexAnswer {
            gameScoreAF = gameScoreAF - 500
            showWrong = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showWrong = false
            }
            if gameScoreAF < 1 {
                gameScoreAF = 0
            }
            
            /*
             endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreEU))")
             gameOver()
             */
        } else if gameRoundTimer < 1 {
            endroundtimeout.toggle()
        }
        if RoundTimer >= 42 {
           RoundTimer = 40
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
        gameScoreAF = 0
        RoundTimer = 40
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
            AfricaLang = "Quiz Africa"
            playAgain = "Play again"
            endOfTextENG = "Total points: "
        } else {
            CountryName = CountryName
            AfricaLang = "Quiz Afrika"
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
    class snowFall: SKScene{
        override func sceneDidLoad() {
            
            size = UIScreen.main.bounds.size
            scaleMode = .resizeFill
            
            anchorPoint = CGPoint(x: 0.5, y: 1)
            
            backgroundColor = .clear
                
            
            let node = SKEmitterNode (fileNamed: "snowFall.sks")!
            addChild(node)
        }
    }
}


struct AfricaQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AfricaQuiz()
    }
}
