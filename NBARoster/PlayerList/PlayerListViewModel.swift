

import Foundation

protocol PlayerListViewModelProtocol: ObservableObject  {
    var players: [Player] { get }
    var isLoading: Bool { get }
    func showDetail(for player: Player)
    func loadPlayers() async
}


@MainActor
class PlayerListViewModel: PlayerListViewModelProtocol {
    @Published var players: [Player] = []
    @Published var isLoading = false
    @Published var error: String?
    let apiService: APIService
    
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol,
         apiService: APIService
    ) {
        self.coordinator = coordinator
        self.apiService = apiService
    }
    
    func showDetail(for player: Player) {
        coordinator.showDetail(for: player)
    }
    
    
    func loadPlayers() async {
        isLoading = true
        do {
            let result = try await apiService.fetchPlayers()
            self.players = result
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    
}
