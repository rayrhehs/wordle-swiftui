import SwiftUI

struct GuessData {
    let answerWordList: Set<String>
    let allowedWordList: Set<String>
    
    var targetWord: String
    var currentGuess:[String] = []
    var pastGuesses:[[String]] = []
    var maxGuessLetters = 5
    var maxGuesses = 6
    var numberOfGuesses = 0
    var rowSubmission: [Bool] = []
    
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
}
