import UIKit
import Foundation

class Checker {
    
    static var shared = Checker()
    
    private let login: String = "login"
    private let password: String = "password"
    
    private init() {}
    
    func check(loginn: String , passwordd: String ) -> Bool {
        
        if loginn == login && passwordd == password {
            return true
        }
        
        return false
        
    }
    
}
