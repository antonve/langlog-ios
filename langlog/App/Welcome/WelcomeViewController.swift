import UIKit
import ReactorKit
import SnapKit
import Then

class WelcomeViewController: UIViewController, ViewConstructor, View {
    fileprivate struct Const {
        static let padding: CGFloat = 50
        static let spacing: CGFloat = 12
    }

    struct Callback {
        let didTapLogin: (() -> Void)
        let didTapRegister: (() -> Void)
    }

    private let callback: Callback

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

    init(callback: Callback) {
        self.callback = callback
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
