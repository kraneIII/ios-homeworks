import UIKit
import Foundation

class FeedFlowCoordinator: FeedBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    lazy var navigationController = UINavigationController()
    
    func start()-> UIViewController {
        let feedModel = FeedViewModel()
        rootViewController = UINavigationController(rootViewController: FeedViewController(feedModel: feedModel))
        
        return rootViewController
    }
    
    func showScreen() {
        parentCoordinator?.moveTo(flow: .login)
        
    }
    
}
