import Foundation

enum Number: CaseIterable {
    case one
    case two
    case three
}

enum Symbol: CaseIterable {
    case circle
    case square
    case diamond
}

enum Color: CaseIterable {
    case red
    case green
    case blue
}

enum Shading: CaseIterable {
    case open
    case striped
    case solid
}

struct Card: CustomDebugStringConvertible {
    let number: Number
    let symbol: Symbol
    let color: Color
    let shading: Shading

    var isFaceUp = false

    var debugDescription: String { "\(number) -- \(symbol) -- \(color) -- \(shading)" }
}

struct Deck {
    let cards: [Card]

    init() {
        var cards: [Card] = []
        for number in Number.allCases {
            for symbol in Symbol.allCases {
                for color in Color.allCases {
                    for shading in Shading.allCases {
                        cards.append(
                            Card(number: number, symbol: symbol, color: color, shading: shading))
                    }
                }
            }
        }
        self.cards = cards
    }
}
