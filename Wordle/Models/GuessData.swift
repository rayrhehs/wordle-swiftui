import SwiftUI

struct GuessData {
    static let answerWordList: Set<String> = WordLoader.loadWords(from: "answer_words")
    static let allowedWordList: Set<String> = WordLoader.loadWords(from: "allowed_words")
    
    var targetWord = answerWordList.randomElement()!
    var currentGuess:[String] = []
    var pastGuesses:[[String]] = []
    var maxGuessLetters = 5
    var maxGuesses = 6
    var numberOfGuesses = 0
    var rowSubmission: [Bool] = []
    
    var targetWordArray: [String] {
        targetWord.map { String($0) }
    }
    var targetWordLettersCount: [String: Int] {
        Dictionary(grouping: targetWordArray, by: { $0 })
            .mapValues { $0.count }
    }
}
