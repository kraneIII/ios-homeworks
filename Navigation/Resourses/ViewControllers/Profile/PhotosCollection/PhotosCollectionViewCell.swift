

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let image = UIImageView()
    let collectionOfPhotosGenerator = PhotosViewController()
    
    private lazy var postCellImage: UIImageView = {
        let postCellImage = UIImageView()
        postCellImage.translatesAutoresizingMaskIntoConstraints = false
        
        return postCellImage
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        cellImageLayout()
        addSubView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        addSubview(image)
        contentView.addSubview(postCellImage)
    }
    
    //MARK: - Private
    
    private func cellImageLayout() {
        addSubView()
        NSLayoutConstraint.activate([
        
            postCellImage.widthAnchor.constraint(equalToConstant: 120),
            postCellImage.heightAnchor.constraint(equalToConstant: 120),
            
            postCellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            postCellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postCellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postCellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
    func foo() {
        collectionOfPhotosGenerator.receive(images: photoCollection)
    }
    
    func congigure(with collectionImage: [UIImage]) {
//        collectionOfPhotosGenerator.receive(images: photoCollection)
        postCellImage.image = photoCollection.randomElement()
        
    }
    
}
