import Then
import SnapKit
import UIKit


class EditTimeViewController: BaseVC<EditTimeViewModel> {
    
    private let timeEditView = TimeInputView().then {
        $0.layer.cornerRadius = 8
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
    }
    
    override func addView() {
        view.addSubviews(timeEditView)
    }
    
    override func setLayout() {
        timeEditView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(330)
            $0.top.equalToSuperview().inset(173)
        }
    }
}
