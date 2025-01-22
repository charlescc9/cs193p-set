import SwiftUI

struct SetView: View {
    let viewModel: GameViewModel

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 96))]) {
                    ForEach(viewModel.table) { card in
                        CardView(card: card, viewModel: viewModel)
                    }
                }
                .padding()
            }
            Spacer()
            HStack {
                Button("New Game") {
                    
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("Deal 3 More Cards") {
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)
        }
    }
}

struct CardView: View {
    let card: Card
    let viewModel: GameViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.white)
            .strokeBorder(.black, lineWidth: 2)
            .overlay {
                VStack() {
                    ForEach((1...card.number), id: \.self) { _ in
                        switch card.symbol {
                        case .circle:
                            viewModel.applyColorAndShading(to: Circle(), forCard: card)
                        case .square:
                            viewModel.applyColorAndShading(to: Rectangle(), forCard: card)
                        case .diamond:
                            viewModel.applyColorAndShading(to: Capsule(), forCard: card)
                        }
                    }
                    .padding(10)
                }
            }
            .aspectRatio(2.5/3.5, contentMode: .fit)
    }
}

#Preview {
    SetView(viewModel: GameViewModel())
}
