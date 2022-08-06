import Then
import SnapKit
import UIKit

class EditTimeViewController: BaseVC<EditTimeViewModel> {
    
    private let timeInputView = TimeInputView()

    override func configureVC() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
    }
    
    override func addView() {
        view.addSubviews(timeInputView)
    }
    
    override func setLayout() {
        timeInputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}
