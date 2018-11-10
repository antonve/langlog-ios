import Swinject

class WelcomeCoordinator: NavigationCoordinator {
    var navigationController = UINavigationController()
    var resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func start() {
        let callback = WelcomeViewController.Callback(
            didTapLogin: { print("login") },
            didTapRegister: { [weak self] in self?.showSignup() }
        )
        let viewController = WelcomeViewController(callback: callback)
        viewController.reactor = WelcomeReactor()

        navigationController.pushViewController(viewController, animated: false)
    }

    private func showSignup() {
        let callback = SignupViewController.Callback(
            didTapSubmit: { print("submit") }
        )
        let viewController = SignupViewController(callback: callback)
        viewController.reactor = SignupReactor()

        navigationController.pushViewController(viewController, animated: true)
    }
}
