import SwiftUI

// an enum is a type that groups related values
// normally it is used to save data - GameState, Result, etc.
// but an enum without cases (name for related values) cannot be instatiated and thus can be used as a container for utility functions

enum WordLoader {
    static func loadWords(from filename: String) -> Set<String> {
        
        // finding file
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: "txt") else {
            fatalError("Could not find filenamed: \(filename).txt in bundle.")
        }
        
        // loading file
        do {
            let fileContent = try String(contentsOf: fileURL, encoding: .utf8)
            let dictionary = DictionaryFile(contents: fileContent)
            
            return dictionary.processedWordsSet
            
        } catch {
            fatalError("Error loaded \(filename).txt: \(error)")
        }
    }
}

// what does static mean?
// i don't know what from is and what it means
// i don't know what do catch are
// what is try used for
