import RxCoordinator

enum MainRoute: Route {
    case welcome

    func prepareTransition(coordinator: AnyCoordinator<MainRoute>) -> NavigationTransition {
        switch self {
        case .welcome:
            let viewController = WelcomeViewController()
            return .push(viewController)
        }
    }
}
