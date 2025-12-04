import SwiftUI

struct DictionaryFile {
    let contents: String
    
    var wordsArray: [String] {
        contents
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
    
    var wordsSet: Set<String> {
        Set(wordsArray)
    }
}
