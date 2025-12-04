import SwiftUI

struct DictionaryFile {
    let contents: String
    
    var wordsArray: [String] {
        contents
            .components(separatedBy: .newlines) // converts to array
            .filter { !$0.isEmpty } // filter data
    }
    
    // calls wordsArray like a function and applies .map
    var processedWordsSet: Set<String> {
        Set(wordsArray.map { $0.uppercased().trimmingCharacters(in: .whitespaces)})
    }
}
