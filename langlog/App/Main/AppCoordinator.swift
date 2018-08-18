import RxCoordinator

class AppCoordinator: Coordinator {
    typealias CoordinatorRoute = MainRoute

    var context: UIViewController!
    var navigationController: UIViewController = UINavigationController()

    var rootViewController: UIViewController {
        get {
            return self.navigationController
        }
    }

    init() {}

    func presented(from presentable: Presentable?) {
        transition(to: .login)
    }
}
