import UIKit

class LabeledTextInput: UIStackView, ViewConstructor {
    struct Const {
        static let textFieldHeight: CGFloat = 48
        static let spacing: CGFloat = 12
        static let fontSize: CGFloat = 18
    }

    let label = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: Const.fontSize)
    }

    let textField = UITextField()

    init(label: String, placeholder: String) {
        super.init(frame: .zero)

        self.label.text = label
        textField.placeholder = placeholder

        setupViews()
        setupConstraints()
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        alignment = .fill
        axis = .vertical
        spacing = Const.spacing

        textField.layer.cornerRadius = 10
        textField.backgroundColor = .red

        addArrangedSubview(label)
        addArrangedSubview(textField)
    }

    func setupConstraints() {
        textField.snp.makeConstraints {
            $0.height.equalTo(Const.textFieldHeight)
        }
    }
}
