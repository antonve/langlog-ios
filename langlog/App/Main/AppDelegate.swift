import Swinject
import SwinjectAutoregistration
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // swiftlint:disable:next implicitly_unwrapped_optional
    var coordinator: AppCoordinator!

    var assembler = Assembler([
        AppAssembly(),
    ])

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        coordinator = AppCoordinator(resolver: assembler.resolver)
        coordinator.start()

        return true
    }
}
