import Foundation

class PrivancyPolicyViewController: BaseVC<PrivancyPolicyViewModel> {
    
    override func configureVC() {
        print(viewModel.readTxtFile())
    }
}
