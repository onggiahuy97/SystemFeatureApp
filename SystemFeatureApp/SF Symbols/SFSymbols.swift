import Foundation

class SFSymbolsViewModel {
    static let SFSymbols: [String] = {
        guard let path = Bundle.main.path(forResource: "symbolsText", ofType: "txt") else { return [] }
        guard let data = try? String(contentsOfFile: path, encoding: .utf8) else { return [] }
        return data.split(whereSeparator: \.isNewline).map { String($0) }
    }()
}
