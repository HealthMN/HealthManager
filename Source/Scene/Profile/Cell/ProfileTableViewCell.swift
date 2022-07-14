import Foundation
import UIKit
import Then
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    let titleTextLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        contentView.addSubviews(titleTextLabel)
    }
    
    func setLayout() {
        titleTextLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
    }
}
