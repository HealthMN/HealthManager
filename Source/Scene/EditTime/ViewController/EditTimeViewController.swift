import Then
import SnapKit
import UIKit


class EditTimeViewController: BaseVC<EditTimeViewModel> {
    
    private let tapGesture = UITapGestureRecognizer(target: self, action: #selector(timeEditViewDidTap(_:)))
    
    private let timeEditView = TimeInputView()
    
    @objc func timeEditViewDidTap(_ sender: UITapGestureRecognizer) {
        print("gesture!!")
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        timeEditView.addGestureRecognizer(tapGesture)
    }
    
    override func addView() {
        view.addSubviews(timeEditView)
    }
    
    override func setLayout() {
        timeEditView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}
