import SwiftUI

struct SetView: View {
    let viewModel: SetViewModel

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(.white)
                .strokeBorder(.red, lineWidth: 5)
                .overlay {
                    Text(viewModel.deck.cards[0].symbol == Symbol.circle ? "Circle" : "Else")
                }
        }
        .padding()
    }
}

#Preview {
    SetView(viewModel: SetViewModel())
}
