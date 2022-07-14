import Foundation

final class ProfileGraphVC: BaseVC {
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewModel: ProfileViewModel
    
    override func configureVC() {
        viewModel.coordinator?.presentProfileGraphVC()
    }
}
