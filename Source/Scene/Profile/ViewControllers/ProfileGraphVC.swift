import Foundation

final class ProfileGraphVC: BaseVC<ProfileViewModel> {
    override func configureVC() {
        viewModel.presentProfileVC()
    }
}
