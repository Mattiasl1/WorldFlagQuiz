//
//  CountryTapped.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-24.
//

import Foundation

@State private var correctIndexAnswer = 0
@State private var answerText = ""
@State private var endOfGameText = ""
@State private var gameScore = 0
@State private var currentRound = 1
@State private var showingScore = true
@State private var endOfGame = false

@State private var timeRemaining = 12
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()



func CountryTapped(_ number: Int) {
   

    if number == correctIndexAnswer {
        gameScore = 10 + timeRemaining + gameScore
        timeRemaining = 12
        self.askQuestion()
    } else if number != correctIndexAnswer {
        endOfGameText = "Game Over!"
        gameOver()
        timeRemaining = 0
    }; if timeRemaining < 0 {
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
    gameScore = 0
    currentRound = 1
    askQuestion()
}

func timeRunOut() {
    if timeRemaining == 0{
        endOfGame = true
    }
}
