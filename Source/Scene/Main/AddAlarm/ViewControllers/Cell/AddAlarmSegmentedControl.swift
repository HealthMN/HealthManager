import UIKit

protocol AddAlarmSegmentedControlDelegate: AnyObject {
    func segmentValueChanged(to index: Int, sender: AddAlarmSegmentedControl)
}

final class AddAlarmSegmentedControl: UIView {
    
    weak var delegate: AddAlarmSegmentedControlDelegate?
    private var titles: [String] = []
    private var buttons: [UIButton] = []
    
    private var unselectedTextColor: UIColor = UIColor.Theme.lightGray
    private var selectedTextColor: UIColor = .white
    private var unselectedBackgroundColor: UIColor = UIColor.Theme.lightGray
    private var selectedBackgroundColors: [UIColor] = [UIColor.Theme.blue,
                                               UIColor.Theme.green,
                                               UIColor.Theme.orange,
                                               UIColor.Theme.yellow,
                                               UIColor.Theme.red]
    private var borderColor: UIColor = .clear
    var selectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init (
        titles: [String]
    ) {
        self.init(frame: .zero)
        self.titles = titles
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    fileprivate func updateView() {
        setButtons()
        configStack()
    }
    
    fileprivate func setButtons() {
        self.buttons = []
        self.subviews.forEach{ $0.removeFromSuperview() }
        titles.forEach {
            let button = UIButton()
            button.setTitle($0, for: .normal)
            button.setTitleColor(unselectedTextColor, for: .normal)
            button.backgroundColor = unselectedBackgroundColor
            button.layer.borderWidth = 1
            button.layer.borderColor = borderColor.cgColor
            button.layer.cornerRadius = 25
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
            if #available(iOS 15.0, *) {
                button.configuration = .filled()
                button.configuration?.contentInsets = .init(top: 15, leading: 0, bottom: 15, trailing: 0)
                button.configuration?.baseBackgroundColor = unselectedBackgroundColor
            } else {
                button.contentEdgeInsets = .init(top: 15, left: 0, bottom: 15, right: 0)
            }
            self.buttons.append(button)
        }
        initialState()
    }
    fileprivate func initialState() {
        let index = selectedIndex
        if #available(iOS 15.0, *) {
            buttons[index].configuration?.baseBackgroundColor = selectedBackgroundColors[index]
            buttons[index].configuration?.baseForegroundColor = selectedTextColor
        } else {
            buttons[index].backgroundColor = selectedBackgroundColors[index]
        }
        buttons[index].setTitleColor(selectedTextColor, for: .normal)
        buttons[index].layer.borderColor = UIColor.clear.cgColor
    }
    fileprivate func configStack() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 20
        self.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc private func buttonDidTapped(_ sender: UIButton) {
        buttons.enumerated().forEach{ index, button in
            if #available(iOS 15.0, *) {
                button.configuration?.baseBackgroundColor = unselectedBackgroundColor
                button.configuration?.baseForegroundColor = unselectedTextColor
            } else {
                button.backgroundColor = unselectedBackgroundColor
            }
            button.titleLabel?.textColor = unselectedTextColor
            button.layer.borderColor = borderColor.cgColor
            if button == sender {
                if #available(iOS 15.0, *) {
                    button.configuration?.baseBackgroundColor = selectedBackgroundColors[index]
                    button.configuration?.baseForegroundColor = selectedTextColor
                } else {
                    button.backgroundColor = unselectedBackgroundColor
                }
                button.setTitleColor(selectedTextColor, for: .normal)
                button.layer.borderColor = UIColor.clear.cgColor
                self.selectedIndex = index
                self.delegate?.segmentValueChanged(to: index, sender: self)
            }
        }
    }
}
