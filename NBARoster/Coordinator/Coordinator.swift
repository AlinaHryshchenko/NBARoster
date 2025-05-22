

import Foundation
import SwiftUI

// MARK: - MainCoordinatorProtocol
protocol CoordinatorProtocol {
    func pushViewController(_ controller: UIViewController)
    func showDetail(for player: Player)
}

// MARK: - MainCoordinator
final class Coordinator: CoordinatorProtocol {
    var rootNavigationController: UINavigationController
    let apiService: APIService = APIService()
    
    // MARK: - Initialization
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    // MARK: - Start
    @MainActor
    func start() {
        let playerListViewModel = PlayerListViewModel(coordinator: self, apiService: apiService)
        let view = PlayerListView(viewModel: playerListViewModel)
        let hostingController = UIHostingController(rootView: view)
        
        rootNavigationController.viewControllers = [hostingController]
    }
    
    func showDetail(for player: Player) {
        let viewModel = PlayerDetailViewModel(coordinator: self, player: player)
        let view = PlayerDetailView(viewModel: viewModel)
        let host = UIHostingController(rootView: view)
        
        self.pushViewController(host)
    }
    
    func pushViewController(_ controller: UIViewController) {
        rootNavigationController.pushViewController(controller, animated: true)
    }
    
}
