import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        WindowGroup {
            SetView(viewModel: GameViewModel())
        }
    }
}
