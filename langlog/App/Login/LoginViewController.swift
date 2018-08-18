import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController, ViewConstructor {
    struct Const {
        static let padding: CGFloat = 50
    }

    private let loginButton = LoginButton().then {
        $0.setTitle("Log in", for: .normal)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(hex: 0xf5f8f1)

        view.addSubview(loginButton)
    }

    func setupConstraints() {
        loginButton.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(Const.padding)
        }
    }
}
