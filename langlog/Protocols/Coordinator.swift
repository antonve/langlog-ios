import Swinject

protocol Coordinator {
    var resolver: Resolver { get set }
    var presenter: UIViewController { get }

    func start()
}
