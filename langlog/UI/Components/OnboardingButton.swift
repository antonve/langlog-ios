import UIKit

class OnboardingButton: UIButton, ViewConstructor {
    struct Const {
        static let height: CGFloat = 48
    }

    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        backgroundColor = .blue
        layer.cornerRadius = 10
    }

    func setupConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(Const.height)
        }
    }
}
