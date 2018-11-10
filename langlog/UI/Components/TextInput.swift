import UIKit

class TextInput: UITextField, ViewConstructor {
    struct Const {
        static let height: CGFloat = 48
        static let fontSize: CGFloat = 18
        static let padding: CGFloat = 12
    }

    init(placeholder: String) {
        super.init(frame: .zero)

        self.placeholder = placeholder

        setupViews()
        setupConstraints()
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        layer.cornerRadius = 10
        backgroundColor = .white

        leftView = UIView(frame: CGRect(x: 0, y: 0, width: Const.padding, height: Const.height))
        leftViewMode = .always
    }

    func setupConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(Const.height)
        }
    }
}
