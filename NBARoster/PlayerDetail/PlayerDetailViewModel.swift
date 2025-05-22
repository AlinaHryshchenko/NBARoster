

import Foundation

protocol PlayerDetailViewModelProtocol: ObservableObject  {
    var player: Player {get set}
}

final class PlayerDetailViewModel: PlayerDetailViewModelProtocol {
    private let coordinator: CoordinatorProtocol
    var player: Player
    
    init(
        coordinator: CoordinatorProtocol,
         player: Player
    ) {
        self.coordinator = coordinator
        self.player = player
    }
}
