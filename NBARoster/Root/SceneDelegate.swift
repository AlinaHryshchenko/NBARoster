
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
            guard let windowScene = scene as? UIWindowScene else { return }
            let navigationController = UINavigationController()
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            self.window = window
            window.overrideUserInterfaceStyle = .light
            
            // Initialize the main coordinator with the navigation controller
            let coordinator = Coordinator(rootNavigationController: navigationController)
            coordinator.start()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        }

    func sceneDidBecomeActive(_ scene: UIScene) {
       }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

