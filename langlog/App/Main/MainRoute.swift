import RxCoordinator

enum MainRoute: Route {
    case welcome

    func prepareTransition(coordinator: AnyCoordinator<MainRoute>) -> NavigationTransition {
        switch self {
        case .welcome:
            let callback = WelcomeViewController.Callback(
                didTapLogin: { print("login") },
                didTapRegister: { print("register") }
            )
            let viewController = WelcomeViewController(callback: callback)
            return .push(viewController)
        }
    }
}
