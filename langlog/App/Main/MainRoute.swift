import RxCoordinator

enum MainRoute: Route {
    case login

    func prepareTransition(coordinator: AnyCoordinator<MainRoute>) -> NavigationTransition {
        switch self {
        case .login:
            let viewController = LoginViewController()
            return .push(viewController)
        }
    }
}
