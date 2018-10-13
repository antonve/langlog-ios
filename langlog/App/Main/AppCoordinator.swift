import RxCoordinator

class AppCoordinator: Coordinator {
    typealias CoordinatorRoute = MainRoute

    var context: UIViewController!
    var navigationController: UIViewController = UINavigationController()

    var rootViewController: UIViewController {
        return navigationController
    }

    init() {}

    func presented(from _: Presentable?) {
        transition(to: .welcome)
    }
}
