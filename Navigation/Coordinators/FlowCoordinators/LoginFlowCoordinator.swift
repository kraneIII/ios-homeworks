import UIKit
import Foundation

class LoginFlowCoordinator: LoginBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    lazy var navigationController = UINavigationController()
    
    func start()-> UIViewController {
        rootViewController = UINavigationController(rootViewController: LogInViewController())
        
        return rootViewController
    }
    
    func showScreen() {
        parentCoordinator?.moveTo(flow: .feed)
    }


    
    
}
