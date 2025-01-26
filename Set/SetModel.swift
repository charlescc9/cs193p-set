import Foundation

enum SetNumber: Int, CaseIterable {
    case one = 1, two, three
}

enum SetSymbol: CaseIterable {
    case oval
    case rect
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

enum SetSelection {
    case none
    case selected
    case matched
    case notMatched
}

struct Card: Identifiable {
    let id: String
    let number: SetNumber
    let symbol: SetSymbol
    let color: SetColor
    let shading: SetShading
    var selection = SetSelection.none
}

struct Game {
    private(set) var deck: [Card]
    private(set) var table: [Card]
    private var selected: [Int] = []

    init() {
        var cards: [Card] = []
        for number in SetNumber.allCases {
            for symbol in SetSymbol.allCases {
                for color in SetColor.allCases {
                    for shading in SetShading.allCases {
                        cards.append(
                            Card(
                                id: "\(number)\(symbol)\(color)\(shading)", number: number, symbol: symbol,
                                color: color, shading: shading))
                    }
                }
            }
        }
//        cards.shuffle()

        table = Array(cards.prefix(12))
        deck = Array(cards.suffix(cards.count - 12))
    }

    mutating func selectCard(_ card: Card) {
        
        // Get selected card
        if let i = table.firstIndex(where: { $0.id == card.id }) {

            // Update card color
            switch table[i].selection {
            case SetSelection.none:
                table[i].selection = SetSelection.selected
                selected.append(i)
            default:
                table[i].selection = SetSelection.none
                if let selectedIndex = selected.firstIndex(where: { $0 == i }) { selected.remove(at: selectedIndex) }
            }

            // Check for match and handle
            if selected.count == 3 {
                let matched = checkMatch()
                for i in selected {
                    table[i].selection = matched ? SetSelection.matched : SetSelection.notMatched
                }
            }
        }
    }

    func isMatched<T: Equatable>(_ one: T, _ two: T, _ three: T) -> Bool {
        let same = (one == two) && (two == three)
        let different = (one != two) && (two != three)
        return same || different
    }
    
    func checkMatch() -> Bool {
        if selected.count != 3 { return false }
        
        let one = table[selected[0]]
        let two = table[selected[1]]
        let three = table[selected[2]]
    
        let numberMatched = isMatched(one.number, two.number, three.number)
        let symbolMatched = isMatched(one.symbol, two.symbol, three.symbol)
        let colorMatched = isMatched(one.color, two.color, three.color)
        let shadingMatched = isMatched(one.shading, two.shading, three.shading)
        
        return numberMatched && symbolMatched && colorMatched && shadingMatched
    }
}
