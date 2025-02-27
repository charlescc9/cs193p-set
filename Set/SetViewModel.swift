import SwiftUI

@Observable class GameViewModel {
    private static let colorDict = [
        SetColor.red: Color.red,
        SetColor.green: Color.green,
        SetColor.blue: Color.blue,
    ]

    static let SelectionDict = [
        SetSelection.none: Color.black,
        SetSelection.selected: Color.blue,
        SetSelection.matched: Color.green,
        SetSelection.notMatched: Color.red,
    ]

    private var game = Game()
    var table: [Card] { game.table }

    func applyColorAndShading(to shape: some Shape, forCard card: Card) -> some View {
        switch card.shading {
        case .open:
            shape
                .stroke(GameViewModel.colorDict[card.color] ?? Color.black, lineWidth: 3)
                .fill(.clear)
                .opacity(1)
        case .striped:
            shape
                .stroke(.clear, lineWidth: 3)
                .fill(GameViewModel.colorDict[card.color] ?? Color.black)
                .opacity(0.25)
        case .solid:
            shape
                .stroke(.clear, lineWidth: 3)
                .fill(GameViewModel.colorDict[card.color] ?? Color.black)
                .opacity(1)
        }
    }

    func selectCard(_ card: Card) {
        game.selectCard(card)
    }
}
