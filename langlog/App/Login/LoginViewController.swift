import UIKit

class LoginViewController: UIViewController {
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(hex: 0xf5f8f1)
    }

    func setupViewConstraints() {}
}
