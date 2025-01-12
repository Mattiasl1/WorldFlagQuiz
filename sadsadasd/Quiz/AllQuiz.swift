//
//  AllQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI
import AVFoundation
import Firebase
import SpriteKit

struct AllImageQuiz: View {
    
    var imageName: String
    
    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 320, height: 200)
            .shadow(color: .black, radius: 10, x: 0, y: 0)
    }
}

struct AllQuiz: View {
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    @State private var TimeToStart = 3
    let Starttimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var RoundTimer = 42
    let RoundtimerCounter = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreALL = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
    
    @State private var CountryNameEN = ["Albania", "Andorra", "Austria", "Belarus", "Belgium", "Bosnia", "Bulgaria", "Croatia", "Czechia", "Denmark", "Estonia", "France", "Finland", "Germany", "Greece", "Iceland", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Moldova", "Netherlands", "North Macedonia", "Norway", "Liechtenstein", "Malta", "Monaco", "Montenegro", "Poland", "Portugal", "Romania", "Russia", "SanMarino", "Schweiz", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Ukraine", "Hungary", "United Kingdom", "Vatican City", "Armenia", "Azerbaijan", "Cambodia", "China", "Cyprus", "India", "Indonesia", "Iraq", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Kyrgyzstan", "Lebanon", "Maldives", "Mongolia", "Nepal", "United arab Emirates", "Israel", "Laos", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines", "Saudi Arabia", "South Korea", "Syria", "Tajikistan", "Thailand", "Taiwan", "Timor-Leste", "Turkey", "Singapore", "Qatar", "Uzbekistan", "Vietnam", "Yemen", "Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.African Republic", "Cameroon", "Djibouti", "Cape Verde", "Chad", "Comoros", "DR Congo", "Egypt", "Equatorial Guinea", "Eritrea", "Eswatini", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "GuineaBissau", "Ivory Coast", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria", "Republic of Congo", "Rwanda", "Sao Tome & Principe", "Senegal", "Seychelles", "SierraLeone", "Somalia", "South Africa", "South Sudan", "Sudan", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe", "Antigua & Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brazil", "Canada", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominica", "Dominican Republic", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts & Nevis", "Saint Lucia", "Saint Vincent & Grenadines", "Suriname", "Trinidad & Tobago", "Usa", "Uruguay", "Venezuela"].shuffled()
    
    @State private var CountryName = ["Algeriet", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.Afrikanska republiken", "Djibouti", "Egypten", "Ekvatorialguinea", "Elfenbenskusten", "Eritrea", "Etiopien", "Gabon", "Gambia", "Japan", "Jemen", "Jordanien", "Kambodja", "Ghana", "Guinea", "GuineaBissau", "Kamerun", "Kapverde", "Kenya", "KongoBrazzaville", "KongoKinshasa", "Lesotho", "Liberia", "Libyen", "Madagaskar", "Malawi", "Mali", "Marocko", "Mauretanien", "Mauritius", "Moçambique", "Namibia", "Niger", "Nigeria", "Rwanda", "São Tomé och Príncipe", "Senegal", "Seychellerna", "Sierraleone", "Somalia", "Sudan", "Swaziland", "Sydafrika", "Sydsudan", "Tanzania", "Tchad", "Togo", "Tunisien", "Uganda", "Zambia", "Zimbabwe", "Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Österrike", "Afghanistan", "Armenien", "Azerbajdzjan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cypern", "Filippinerna", "Förenade Arabemiraten", "Indien", "Indonesien", "Irak", "Iran", "Israel", "Japan", "Jemen", "Jordanien", "Kambodja", "Kazakstan", "Kina", "Kirgizistan", "Kuwait", "Laos", "Libanon", "Malaysia", "Maldiverna", "Mongoliet", "Myanmar", "Nepal", "Nordkorea", "Oman", "Pakistan", "Qatar", "Saudiarabien", "Singapore", "Sri Lanka", "Sydkorea", "Syrien", "Tadzjikistan", "Taiwan", "Thailand", "Turkiet", "Turkmenistan", "Uzbekistan", "Vietnam", "Östtimor", "Antigua och Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brasilien", "Chile", "Colombia", "Costa Rica", "Dominica", "Dominikanska republiken", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Kanada", "Kuba", "Mexiko", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts och Nevis", "Saint Lucia", "Saint Vincent", "Surinam", "Trinidad och Tobago", "Uruguay", "Usa", "Venezuela", "Australien", "Fiji", "Kiribati", "Marshallöarna", "Mikronesien", "Nauru", "Nya Zeeland", "Palau", "Papua Nya Guinea", "Salomonöarna", "Samoa", "Tonga", "Tuvalu", "Vanuatu"].shuffled()
    
    @State private var showALLscore : Int = 0
    @State var showCorrect = false
    @State var AllLang = "Quiz World"
    @State var playAgain = "Play again"
    @State var Countdown : Int = 3
    @State private var showendOfGameAlert = false
    @State var endOfTextENG = "Total points!"
    @State var StartRound = false
    @State var isVisible = false
    @State var gameRoundTimer : Int = 40
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
                    Text(AllLang)
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
                    
                    Text("\(String(gameScoreALL))")
                        .foregroundColor(Color.black)
                        .font(MyFont.title18)
                }
                
                
                
                .alert(endOfGameText, isPresented: $showendOfGameAlert) {
                    Button(playAgain, role: .cancel) {
                        let oldscore = UserDefaults.standard.integer(forKey: "world")
                        
                        if(gameScoreALL > oldscore)
                        {
                            UserDefaults.standard.set(gameScoreALL, forKey: "world")
                            
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
                
                    Text("+\(String(showALLscore))").fontWeight(.bold).opacity(1).foregroundColor(Color.green).font(MyFont.title50)
                    
                
                
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
                               parameters: [AnalyticsParameterScreenName: "World quiz"])

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
                endOfGameText = ("\(String(endOfTextENG))") + ("\(String(gameScoreALL))")
                gameOver()
            }else if self.RoundTimer > 0 {
                self.RoundTimer -= 1
            }
            
        }
        
        
    }
    func CountryTapped(_ number: Int) {
        
         
         
        
        if number == correctIndexAnswer {
            gameScoreALL =  timeRemaining + gameScoreALL
            showALLscore = timeRemaining
            RoundTimer = RoundTimer + 1
            showCorrect = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showCorrect = false
                self.askQuestion()
                timeRemaining = 300
            }
            
            
            
            
            
            
        } else if number != correctIndexAnswer {
            gameScoreALL = gameScoreALL - 500
            timeRemaining = timeRemaining - 20
            showWrong = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                showWrong = false
            }
            if gameScoreALL < 1 {
                gameScoreALL = 0
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
        gameScoreALL = 0
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
            AllLang = "Quiz World"
            playAgain = "Play again"
            endOfTextENG = "Total points: "
        } else {
            CountryName = CountryName
            AllLang = "Quiz Världen"
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


struct AllQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AllQuiz()
    }
}
