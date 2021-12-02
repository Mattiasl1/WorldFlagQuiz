//
//  AllQuiz.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-18.
//

import SwiftUI
import AVFoundation

struct AllImageQuiz: View {
    
    var imageName: String

    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 300, height: 225)
    }
}

struct AllQuiz: View {
    @State private var timeRemaining = 15
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScoreALL = 0
    @State private var currentRound = 1
    @State private var showingScore = true
    @State private var endOfGame = false
   
    @State private var CountryName = ["Algeriet", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.Afrikanska republiken", "Djibouti", "Egypten", "Ekvatorialguinea", "Elfenbenskusten", "Eritrea", "Etiopien", "Gabon", "Gambia", "Japan", "Jemen", "Jordanien", "Kambodja", "Ghana", "Guinea", "GuineaBissau", "Kamerun", "Kapverde", "Kenya", "KongoBrazzaville", "KongoKinshasa", "Lesotho", "Liberia", "Libyen", "Madagaskar", "Malawi", "Mali", "Marocko", "Mauretanien", "Mauritius", "Moçambique", "Namibia", "Niger", "Nigeria", "Rwanda", "São Tomé och Príncipe", "Senegal", "Seychellerna", "Sierraleone", "Somalia", "Sudan", "Swaziland", "Sydafrika", "Sydsudan", "Tanzania", "Tchad", "Togo", "Tunisien", "Uganda", "Zambia", "Zimbabwe", "Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Skottland", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Wales", "Österrike", "Afghanistan", "Armenien", "Azerbajdzjan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cypern", "Filippinerna", "Förenade Arabemiraten", "Indien", "Indonesien", "Irak", "Iran", "Israel", "Japan", "Jemen", "Jordanien", "Kambodja", "Kazakstan", "Kina", "Kirgizistan", "Kuwait", "Laos", "Libanon", "Malaysia", "Maldiverna", "Mongoliet", "Myanmar", "Nepal", "Nordkorea", "Oman", "Pakistan", "Qatar", "Saudiarabien", "Singapore", "Sri Lanka", "Sydkorea", "Syrien", "Tadzjikistan", "Taiwan", "Thailand", "Turkiet", "Turkmenistan", "Uzbekistan", "Vietnam", "Östtimor", "Antigua och Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brasilien", "Chile", "Colombia", "Costa Rica", "Dominica", "Dominikanska republiken", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Kanada", "Kuba", "Mexiko", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts och Nevis", "Saint Lucia", "Saint Vincent", "Surinam", "Trinidad och Tobago", "Uruguay", "Usa", "Venezuela"].shuffled()
    
    @State var showCorrect = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        VStack {
            VStack{
            Text("Quiz Världen")
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

                Text("\(String(gameScoreALL))")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            
            .padding()
            .alert(isPresented: $endOfGame) {
                Alert(title: Text(endOfGameText), message: Text("Du fick totalt \(gameScoreALL) poäng!"), dismissButton: .default(Text("Spela igen")) {
                    
                    // Spara poäng
                    let oldscore = UserDefaults.standard.integer(forKey: "world")
                    
                    if(gameScoreALL > oldscore)
                    {
                        UserDefaults.standard.set(gameScoreALL, forKey: "world")
                        
                        
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
            gameScoreALL = 10 + timeRemaining + gameScoreALL
            
            currentRound += 1
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
        gameScoreALL = 0
        currentRound = 1
        askQuestion()
    }
    
    func timeRunOut() {
        if timeRemaining == 0{
            endOfGame = true
        }
    }
    
    
}


struct AllQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AllQuiz()
    }
}
