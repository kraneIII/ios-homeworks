
import UIKit



class FeedViewController: UIViewController {
    
    let post = Post(title: "")
    
    
    // MARK: - Button
    
    private lazy var feedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Pressed", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     setupViewController()
        layout()
        }
    
    // MARK: - Setup

    private func setupViewController () {
        view.backgroundColor = .systemCyan
        title = "Feeds"
        
    }
    
    // MARK: - Constraint

    private func layout() {
        view.addSubview(feedButton)
        NSLayoutConstraint.activate([
            feedButton.widthAnchor.constraint(equalToConstant: 100),
            feedButton.heightAnchor.constraint(equalToConstant: 50),
            feedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
    // MARK: - ObkectiveC Func

    @objc private func buttonPressed() {
        let viewController = PostViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.postTitle = post.title
    }
    
        
    }
