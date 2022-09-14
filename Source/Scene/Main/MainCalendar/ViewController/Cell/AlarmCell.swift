import UIKit
import SnapKit
import Then
import RealmSwift

final class AlarmCell: UITableViewCell {
    
    var model: Alarm? {
        didSet { if let model = model { bind(model) } }
    }
        
    private let emojiCircleLabel = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 27.5
    }
    
    private let emojiLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 28)
    }
    
    private let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .blue
    }
    
    private let descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let switchLabel = UISwitch().then {
        $0.onTintColor = HealthManagerAsset.hmPrimary.color
        $0.setSwitch(width: 60, height: 34)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addView()
        setLayout()
    }
    
    @objc func switchDidTap(_ sender: UISwitch) {
        
    }
    
    func bind(_ model: Alarm) {
        
        let date = DateFormatter()
        
        date.dateFormat = "hh시 mm분"
        
        emojiLabel.text = "\(model.icon)"
        timeLabel.text = "\(date.string(from: model.date))"
        descriptionLabel.text = "\(model.title)"
        emojiCircleLabel.backgroundColor = HealthColor(rawValue: "\(model.index)")?.display ?? .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        contentView.addSubviews(emojiCircleLabel, emojiLabel, timeLabel, descriptionLabel, switchLabel)
    }
    
    func setLayout() {
        emojiCircleLabel.snp.makeConstraints {
            $0.size.equalTo(56)
            $0.leading.equalTo(24)
            $0.top.equalTo(14)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.leading.equalTo(emojiCircleLabel.snp.leading).offset(12)
            $0.top.equalTo(emojiCircleLabel.snp.top).offset(12)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(emojiCircleLabel.snp.trailing).offset(18)
            $0.top.equalTo(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(timeLabel)
            $0.top.equalTo(timeLabel.snp.bottom).offset(2)
        }
        
        switchLabel.snp.makeConstraints {
            $0.trailing.equalTo(-26)
            $0.top.equalTo(21)
        }
    }
}
