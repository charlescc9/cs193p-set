import Foundation

enum SetSymbol: CaseIterable {
    case circle
    case square
    case diamond
}

enum SetColor: CaseIterable {
    case red
    case green
    case blue
}

enum SetShading: CaseIterable {
    case open
    case striped
    case solid
}

struct Card: Identifiable, CustomDebugStringConvertible {
    var id: String

    let number: Int
    let symbol: SetSymbol
    let color: SetColor
    let shading: SetShading

    var isFaceUp = false

    var debugDescription: String { "\(number) -- \(symbol) -- \(color) -- \(shading)" }
}

struct Game {
    private(set) var deck: [Card]
    private(set) var table: [Card]

    init() {
        var cards: [Card] = []
        for number in (1...3) {
            for symbol in SetSymbol.allCases {
                for color in SetColor.allCases {
                    for shading in SetShading.allCases {
                        cards.append(
                            Card(
                                id: "\(number)\(symbol)\(color)\(shading)", number: number,
                                symbol: symbol, color: color, shading: shading))
                    }
                }
            }
        }
        cards.shuffle()

        table = Array(cards.prefix(12))
        deck = Array(cards.suffix(cards.count - 12))
    }
}
