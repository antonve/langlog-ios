import ReactorKit
import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class WelcomeViewController: UIViewController, ViewConstructor, View {
    fileprivate struct Const {
        static let padding: CGFloat = 50
        static let spacing: CGFloat = 12
    }

    struct Callback {
        let didTapLogin: (() -> Void)
        let didTapSignup: (() -> Void)
    }

    private let callback: Callback

    var disposeBag = DisposeBag()

    private let buttonView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = Const.spacing
    }

    private let loginButton = OnboardingButton().then {
        $0.setTitle("Log in", for: .normal)
    }

    private let signupButton = OnboardingButton().then {
        $0.setTitle("Sign up", for: .normal)
    }

    override func viewWillDisappear(_: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
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
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(hex: 0xF5F8F1)

        view.addSubview(buttonView.then {
            $0.addArrangedSubview(loginButton)
            $0.addArrangedSubview(signupButton)
        })
    }

    func setupConstraints() {
        buttonView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(Const.padding)
            $0.bottom.equalTo(additionalSafeAreaInsets.bottom).inset(Const.padding)
        }
    }

    func bind(reactor _: WelcomeReactor) {
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.callback.didTapLogin()
            })
            .disposed(by: disposeBag)

        signupButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.callback.didTapSignup()
            })
            .disposed(by: disposeBag)
    }
}
