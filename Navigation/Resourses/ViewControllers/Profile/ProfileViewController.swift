import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    
    
    // MARK: - Layout
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
    }
    
    // MARK: - Setup
    
    private func setupViewController () {
        view.backgroundColor = .lightGray
        title = "Profile"
    }
}


