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
    private let radius: CGFloat = 4
    
    let card: Card
    let viewModel: GameViewModel

    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: radius)
            rect.strokeBorder(lineWidth: 3)
                .background(rect.fill(.white))
                .overlay {
                    VStack {
                        ForEach((1...card.number), id: \.self) { _ in
                            switch card.symbol {
                            case .circle:
                                viewModel.applyColorAndShading(to: Capsule(), forCard: card)
                            case .rect:
                                viewModel.applyColorAndShading(
                                    to: RoundedRectangle(cornerRadius: radius), forCard: card)
                            case .diamond:
                                viewModel.applyColorAndShading(to: Diamond(), forCard: card)
                            }
                        }
                        .aspectRatio(3 / 1, contentMode: .fit)
                        .padding(10)
                    }
                }
                .aspectRatio(2.5 / 3.5, contentMode: .fit)
                .opacity(card.isFaceUp ? 1 : 0)
            rect.fill(.black)
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let top = CGPoint(x: rect.midX, y: rect.minY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        
        path.move(to: top)
        path.addLine(to: right)
        path.addLine(to: bottom)
        path.addLine(to: left)
        path.addLine(to: top)

        return path
    }
}

#Preview {
    SetView(viewModel: GameViewModel())
}
