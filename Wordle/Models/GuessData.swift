import SwiftUI

struct GuessData {
    let answerWordList: Set<String>
    let allowedWordList: Set<String>
    
    var targetWord: String
    var currentGuess:[String] = []
    var pastGuesses:[[String]] = []
    var numberOfGuesses = 0
    var maxGuesses = 6
    var maxGuessLetters = 5
    var invalidGuess: Bool = false
    var invalidGuessMessage: String = ""
    var letterColors: [String: Color] = Dictionary(uniqueKeysWithValues: "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { (String($0), Color.gray) })

    // this needs an array of strings (chars) that will be checked if they are in the word or not
    mutating func setLetterColor(for letter: String) {
        letterColors[letter] = Color.green
    }
    
    mutating func validateGuess() {
        if (currentGuess.count < maxGuessLetters) {
         invalidGuessMessage = "Not enough letters"
        } else {
            invalidGuessMessage = "Word not in list"
        }
    }
    
    // init has to be used because Swift doesn't know what is being loaded first
    // target word could be loaded before answerWordList = error
    // forces line by line initialization = no error
    init() {
        self.answerWordList = WordLoader.loadWords(from: "answer_words")
        self.allowedWordList = WordLoader.loadWords(from: "allowed_words")
        
        self.targetWord = answerWordList.randomElement()!
    }
    
    var targetWordArray: [String] {
        targetWord.map { String($0) }
    }
    var targetWordLettersCount: [String: Int] {
        Dictionary(grouping: targetWordArray, by: { $0 })
            .mapValues { $0.count }
    }

    
// ignore
//    var getSquareColor: [Color] {
//        // exits function if guard condition not met
//        guard (rowStatus) else {
//            return Array(repeating: Color.white, count: 5)
//        }
//        
//        // creates an array of gray colors of size 5
//        var colors: [Color] = Array(repeating: Color.gray, count: 5)
//        var letterCount: [String: Int] = [:]
//        
//        // check if letter is in right spot and add to local letterCount dictionary variable
//        for column in 0..<5 {
//            
//            let letter = guessLetters[column]
//            
//            if (letter == targetWordArray[column]) {
//                colors[column] = Color.green
//                letterCount[letter, default: 0] += 1
//            }
//        }
//        
//        // check if current letter count is < target letter count if and in the word
//        for column in 0..<5 {
//            if (colors[column] == Color.green) {
//                continue // exit for loop
//            }
//            
//            let letter = guessLetters[column]
//            let currentCount = letterCount[letter, default: 0]
//            let targetCount = targetWordLettersCount[letter, default: 0]
//            
//            if (currentCount < targetCount && targetWordArray.contains(letter)) {
//                colors[column] = Color.yellow
//                letterCount[letter, default: 0] += 1
//            }
//        }
//            
//        return colors
//    }
}
