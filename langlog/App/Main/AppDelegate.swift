import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var coordinator: AppCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        coordinator = AppCoordinator()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = coordinator.rootViewController
        window.makeKeyAndVisible()

        self.window = window

        return true
    }
}

