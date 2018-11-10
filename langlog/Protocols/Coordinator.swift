import Swinject

protocol Coordinator {
    var resolver: Resolver { get set }
    var presenter: UIViewController { get }

    func start()
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}

extension NavigationCoordinator {
    var presenter: UIViewController { return navigationController }
}
