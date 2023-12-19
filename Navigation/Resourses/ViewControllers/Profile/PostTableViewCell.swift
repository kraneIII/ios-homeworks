import UIKit

class PostCell: UITableViewCell {
    
    private lazy var topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        topLabel.numberOfLines = 2
        topLabel.textColor = .black
        
        
    
        return topLabel
    }()
    
    
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func update() {
//
//
//    }
            
}

