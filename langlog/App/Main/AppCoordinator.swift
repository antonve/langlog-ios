import Swinject

class AppCoordinator {
    var resolver: Resolver
    var coordinator: Coordinator
    var window: UIWindow?

    init(resolver: Resolver) {
        self.resolver = resolver
        coordinator = WelcomeCoordinator(resolver: resolver)
    }

    func start() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = coordinator.presenter
        window.makeKeyAndVisible()
        self.window = window

        coordinator.start()
    }
}
