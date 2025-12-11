import SwiftUI

struct GuessData {
    let answerWordList: Set<String>
    let allowedWordList: Set<String>
    
    var targetWord: String
    var currentGuess:[String] = []
    var pastGuesses:[[String]] = []
    var pastGuessesColor: [[Color]] = Array(repeating: Array(repeating: Color.white, count: 5), count: 6)
    var numberOfGuesses = 0
    var maxGuesses = 6
    var maxGuessLetters = 5
    var invalidGuess: Bool = false
    var invalidGuessMessage: String = ""
    var letterColors: [String: Color] = Dictionary(uniqueKeysWithValues: "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { (String($0), Color.lightestGray) })

    mutating func setLetterColor(for wordArray: [String]) {
        
        guard numberOfGuesses < pastGuesses.count else {
                    return
                }
                
                var letterCount: [String: Int] = targetWordLettersCount

        
                // first pass checks for green letter
                for column in 0..<5 {
        
                    let letter = wordArray[column]
        
                    if (letter == targetWordArray[column]) {
                        letterColors[letter] = Color.green
                        pastGuessesColor[numberOfGuesses][column] = Color.green
                        letterCount[letter, default: 0] -= 1
                    }
                }
                
                // second pass checks for yellow letters
                for column in 0..<5 {
                    
                    let letter = wordArray[column]
                    
                    // for green letters
                    if (pastGuessesColor[numberOfGuesses][column] == Color.green) {
                        continue // exit for loop
                    }
                    
                    // for unchanged letters
                    if (targetWordArray.contains(letter) && letterCount[letter, default: 0] > 0) {
                        if letterColors[letter] != Color.green {
                            letterColors[letter] = Color.orange
                        }
                        pastGuessesColor[numberOfGuesses][column] = Color.orange
                        letterCount[letter, default: 0] -= 1
                    } else if (targetWordArray.contains(letter) && letterCount[letter, default: 0] == 0){
                        pastGuessesColor[numberOfGuesses][column] = Color.darkGray
                    } else if (!targetWordArray.contains(letter)) {
                        letterColors[letter] = Color.darkGray
                        pastGuessesColor[numberOfGuesses][column] = Color.darkGray
                    }
            }
                
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
        
//        self.targetWord = answerWordList.randomElement()!
        self.targetWord = "JOUST"
    }
    
    var targetWordArray: [String] {
        targetWord.map { String($0) }
    }
    var targetWordLettersCount: [String: Int] {
        Dictionary(grouping: targetWordArray, by: { $0 })
            .mapValues { $0.count }
    }

}
