import SwiftUI

@Observable class GameViewModel {
    private static let colorDict = [
        SetColor.red: Color.red, SetColor.green: Color.green, SetColor.blue: Color.blue,
    ]
    private static let shadingDict = [
        SetShading.open: 1, SetShading.striped: 0.35, SetShading.solid: 1
    ]

    private var game = Game()
    var table: [Card] { game.table }

    func applyColorAndShading(to shape: some Shape, forCard card: Card) -> some View {
        shape
            .fill(GameViewModel.colorDict[card.color] ?? Color.black)
            .opacity(GameViewModel.shadingDict[card.shading] ?? 0)
    }
}
