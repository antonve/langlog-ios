import ReactorKit
import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class SignupViewController: UIViewController, ViewConstructor, View {
    fileprivate struct Const {
        static let padding: CGFloat = 50
        static let spacing: CGFloat = 12
    }

    struct Callback {
        let didTapSubmit: (() -> Void)
    }

    private let callback: Callback

    var disposeBag = DisposeBag()

    private let formView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = Const.spacing
    }

    private let nameInput = TextInput(placeholder: "Name")
    private let emailInput = TextInput(placeholder: "Email")
    private let passwordInput = TextInput(placeholder: "Password")

    private let submitButton = OnboardingButton().then {
        $0.setTitle("Sign up", for: .normal)
    }

    init(callback: Callback) {
        self.callback = callback
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    func setupViews() {
        title = "Sign up"
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(hex: 0xF5F8F1)

        view.addSubview(formView.then {
            $0.addArrangedSubview(nameInput)
            $0.addArrangedSubview(emailInput)
            $0.addArrangedSubview(passwordInput)
            $0.addArrangedSubview(submitButton)
        })
    }

    func setupConstraints() {
        formView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Const.padding)
        }
    }

    func bind(reactor _: WelcomeReactor) {}
}
