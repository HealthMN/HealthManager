import UIKit
import Then
import SnapKit

final class WarningView: UIView {
    private let warningLabel = UILabel().then {
        $0.textColor = .init(red: 1, green: 0.37, blue: 0.37, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(warningLabel)
        
        warningLabel.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWarningLabel(text: String) {
        warningLabel.text = text
    }
    
    func changedTextalign() {
        warningLabel.textAlignment = .center

        warningLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}
