//
//  EuropeQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI
import AVFoundation
import Firebase
import FirebaseDatabase
import SpriteKit


struct EuropeImageQuiz: View {
    
    var imageName: String
    
    var body: some View {
        
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 280, height: 180)
            .shadow(color: .black, radius: 2, x: 0, y: 0)
        
    }
}


/*
 .frame(width: 320, height: 200)
 .resizable(resizingMode: .stretch)
 .aspectRatio(contentMode: .fit)
 */


struct EuropeQuiz: View {
    
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    @State private var TimeToStart = 3
    let Starttimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var RoundTimer = 41
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
    
    @State private var CountryNameEN = ["Albania", "Andorra", "Austria", "Belarus", "Belgium", "Bosnia", "Bulgaria", "Croatia", "Czechia", "Denmark", "Estonia", "France", "Finland", "Germany", "Greece", "Iceland", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Moldova", "Netherlands", "North Macedonia", "Norway", "Liechtenstein", "Malta", "Monaco", "Montenegro", "Poland", "Portugal", "Romania", "Russia", "SanMarino", "Schweiz", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Ukraine", "Hungary", "United Kingdom", "Vatican City"]
    
    //44
    @State private var CountryName = ["Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Österrike"]
    
    
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
    @State var minusTime = "- " + "500"
    @State var plusTime = +1
    @State var minutes = 0
    @State var seconds = 0
    
    
 
    private let database = Database.database().reference()
    
    
    var body: some View {
        
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.brown, .brown, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            
            
            VStack {
                
                if (StartRound) {
                    Text(europeLang)
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
                    
                    Text("\(String(gameScoreEU))")
                        .foregroundColor(Color.black)
                        .font(MyFont.title18)
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
           
            
            ZStack{
            if(showCorrect)
            {
                
                    Text("+\(String(showEuscore))").fontWeight(.bold).opacity(1).foregroundColor(Color.green).font(MyFont.title50)
                    
                
                
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
                               parameters: [AnalyticsParameterScreenName: "Europe quiz"])
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
            gameScoreEU = gameScoreEU - 500
            timeRemaining = timeRemaining - 20
            if timeRemaining <= 1
            {
                timeRemaining = 0
            }
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
            gameScoreEU = 0
            RoundTimer = 40
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












struct EuropeQuiz_Previews: PreviewProvider {
    static var previews: some View {
        EuropeQuiz()
            .previewLayout(.sizeThatFits)
    }
}





