import UIKit
import StorageService



class FeedViewController: UIViewController {
    
    var post = Post(title: "Something")
    
    //MARK: MVP
    
    private lazy var keyPassword: UITextField = {
        let keyPassword = UITextField()
        keyPassword.translatesAutoresizingMaskIntoConstraints = false
        keyPassword.placeholder = "Password"
        keyPassword.font = UIFont.systemFont(ofSize: 17)
        
        return keyPassword
    }()
    
    private lazy var checkGuessButton = CustomButton(title: "tap", backColor: .black, action: { [weak self] in
        
        let feedModel = FeedModel()
        let passwordWord = self?.keyPassword.text ?? ""
        if feedModel.check(word: passwordWord) == true {
            self?.guessButtonChecker.backgroundColor = .systemGreen
        }
        else {
            self?.guessButtonChecker.backgroundColor = .systemRed
        }
    })
    
    private lazy var guessButtonChecker: UILabel = {
        let guessButtonChecker = UILabel()
        guessButtonChecker.translatesAutoresizingMaskIntoConstraints = false
        guessButtonChecker.backgroundColor = .systemGray3
        guessButtonChecker.layer.cornerRadius = 15
        guessButtonChecker.layer.borderWidth = 0.5
        guessButtonChecker.layer.borderColor = UIColor.black.cgColor
        guessButtonChecker.clipsToBounds = true
        
        return guessButtonChecker
    }()
    
    
    // MARK: - StackUIButtons
    
    private lazy var firstStackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Pressed", for: .normal)
        button.titleLabel?.textColor = .systemGray6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var secondStackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Pressed", for: .normal)
        button.titleLabel?.textColor = .systemGray6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    
    // MARK: - StackView
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(firstStackButton)
        stackView.addArrangedSubview(secondStackButton)
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupViewController()
        layout()
    }
    
    // MARK: - Layout
    private func layout() {
        addSubViews()
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            keyPassword.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            keyPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            keyPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            keyPassword.widthAnchor.constraint(equalToConstant: 20),
            keyPassword.heightAnchor.constraint(equalToConstant: 220),
            
            checkGuessButton.topAnchor.constraint(equalTo: keyPassword.bottomAnchor, constant: 10),
            checkGuessButton.leadingAnchor.constraint(equalTo: keyPassword.leadingAnchor),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 30),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 30),
            
            guessButtonChecker.topAnchor.constraint(equalTo: checkGuessButton.topAnchor),
            guessButtonChecker.leadingAnchor.constraint(equalTo: checkGuessButton.trailingAnchor, constant: 10),
            guessButtonChecker.widthAnchor.constraint(equalToConstant: 30),
            guessButtonChecker.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    private func addSubViews() {
        view.addSubview(keyPassword)
        view.addSubview(checkGuessButton)
        view.addSubview(guessButtonChecker)
        view.addSubview(stackView)

    }
    
    // MARK: - Setup
    
    private func setupViewController () {
        view.backgroundColor = .systemCyan
        title = "Feeds"
        
    }
    
    // MARK: - ObjectiveC Func
    
    @objc private func buttonPressed() {
        let viewController = PostViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.postTitle = post.title
    }
    
    
}
