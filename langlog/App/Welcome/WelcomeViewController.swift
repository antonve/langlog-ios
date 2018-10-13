import UIKit
import SnapKit
import Then

class WelcomeViewController: UIViewController, ViewConstructor {
    struct Const {
        static let padding: CGFloat = 50
        static let spacing: CGFloat = 12
    }

    private let buttonView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = Const.spacing
    }

    private let loginButton = OnboardingButton().then {
        $0.setTitle("Log in", for: .normal)
    }

    private let registerButton = OnboardingButton().then {
        $0.setTitle("Register", for: .normal)
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

        view.addSubview(buttonView.then {
            $0.addArrangedSubview(loginButton)
            $0.addArrangedSubview(registerButton)
        })
    }

    func setupConstraints() {
        buttonView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(Const.padding)
            $0.bottom.equalTo(additionalSafeAreaInsets.bottom).inset(Const.padding)
        }
    }
}
