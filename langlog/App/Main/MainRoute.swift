import RxCoordinator

enum MainRoute: Route {
    case login

    func prepareTransition(coordinator: AnyCoordinator<MainRoute>) -> NavigationTransition {
        switch self {
        case .login:
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor(hex: 0xf5f8f1)
            return .push(viewController)
        }
    }
}
