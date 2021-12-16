//
//  AmericaQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI
import AVFoundation

struct AmericaImageQuiz: View {
    
    var imageName: String

    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 320, height: 200)
            .shadow(color: .black, radius: 10, x: 0, y: 0)
    }
}

struct AmericaQuiz: View {
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    @State private var TimeToStart = 3
    let Starttimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreAM = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
    
    @State private var CountryNameEN = ["Antigua & Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brazil", "Canada", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominica", "Dominican Republic", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts & Nevis", "Saint Lucia", "Saint Vincent & Grenadines", "Suriname", "Trinidad & Tobago", "Usa", "Uruguay", "Venezuela"].shuffled()
   
    @State private var CountryName = ["Antigua och Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brasilien", "Chile", "Colombia", "Costa Rica", "Dominica", "Dominikanska republiken", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Kanada", "Kuba", "Mexiko", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts och Nevis", "Saint Lucia", "Saint Vincent", "Surinam", "Trinidad och Tobago", "Uruguay", "Usa", "Venezuela"].shuffled()
    
    @State private var showAMscore : Int = 0
    @State var showCorrect = false
    @State var AmericaLang = "Quiz America"
    @State var playAgain = "Play again"
    @State var StartRound = false
    @State var Countdown : Int = 3
    @State private var showendOfGameAlert = false
    @State var endOfTextENG = "Total points!"
    @State var isVisible = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack{
                    Text(AmericaLang)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                        
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 4, x: 0, y: 0)
                    
                    
                    
                    /*
                     Text("\(currentRound) / 60")
                         .font(.subheadline)
                         .fontWeight(.medium)
                         .padding()
                     */
                    
                }
                
                EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
                
                
                
                
                //timerview()
                HStack {
                    Text("Score:")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text("\(String(gameScoreAM))")
                        .fontWeight(.bold)
                        .font(.title)
                }
                
                
                
                .alert(endOfGameText, isPresented: $showendOfGameAlert) {
                    Button(playAgain, role: .cancel) {
                        let oldscore = UserDefaults.standard.integer(forKey: "america")
                        
                        if(gameScoreAM > oldscore)
                        {
                            UserDefaults.standard.set(gameScoreAM, forKey: "america")
                            
                        }
                        
                        self.resetGame()
                    }
                }
                /*
                .alert(isPresented: $showendOfGameAlert) {
                    
                    Alert(title: Text(endOfGameText), message:
                            
                            Text("You got a total of \(gameScoreEU) points!"), dismissButton: .default(Text(playAgain)) {
                        
                        // Spara poäng
                        let oldscore = UserDefaults.standard.integer(forKey: "europe")
                        
                        if(gameScoreEU > oldscore)
                        {
                            UserDefaults.standard.set(gameScoreEU, forKey: "europe")
                            
                        }
                        
                        self.resetGame()
                    })
                }
                */
                
                
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
                            
                            .frame(width: 350, height: 70)
                            .background(Color.red)
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
                
                Text("+\(String(showAMscore))").fontWeight(.bold).opacity(1).foregroundColor(Color.white).font(.system(size: 100))
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
         
            }
                        
            
            
            
        }
        .onAppear(perform: {
            doLang()
            StartRound.toggle()
            CountToStart()
            
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
        
        
    }
    func CountryTapped(_ number: Int) {
        /*
         if currentRound >= 60 {
             endOfGameText = "Grattis!"
             gameOver()
         }
         */

        if number == correctIndexAnswer {
            gameScoreAM = timeRemaining + gameScoreAM
            showAMscore = timeRemaining
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showCorrect = false
                self.askQuestion()
                timeRemaining = 300
            }
        }
        
        else if number != correctIndexAnswer {
            endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreAM))")
            gameOver()
            
            /*
             Text("\(String(gameScoreAF))")
             ("\(String(gameScoreAF))")
             */
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
        gameScoreAM = 0
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
            AmericaLang = "Quiz America"
            playAgain = "Play again"
            endOfTextENG = "Total points: "
        } else {
            CountryName = CountryName
            AmericaLang = "Quiz Amerika"
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
            }
        }
        
    }
}


struct AmericaQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AmericaQuiz()
    }
}
