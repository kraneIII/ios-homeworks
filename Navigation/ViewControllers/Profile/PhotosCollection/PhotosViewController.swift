import Foundation
import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let imagePublisherFacade = ImagePublisherFacade()
    let imageProcessor = ImageProcessor()
    
    let photosStorage = CollectionImage.collectionImage()

    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8)
        collectionView.backgroundColor = .white
        
        viewLayout.minimumLineSpacing = 8
        viewLayout.minimumInteritemSpacing = 8
        viewLayout.sectionInset = .init(top: 8, left: 8, bottom: -8, right: -8)
        viewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        return collectionView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        collectionViewLayout()
        TuneCollectionView()
        
//        subscribe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //    private func subscribe() {
    //        imagePublisherFacade.subscribe(self)
    //        imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 10, userImages: photoCollection)
    //        collectionView.reloadData()
    //    }
    
    private func createThread() {
        imageProcessor.processImagesOnThread(sourceImages: photoCollection, filter: .fade, qos: .background, completion: { photo in
            self.collectionView.reloadData()
        } )
    }
    
    private func setupViewController () {
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "RemoveSub", style: .plain, target: self, action: #selector(deleteSub))
        view.backgroundColor = .white
        view.addSubview(collectionView)
        title = "Photo Gallery"
    }
    
    private enum reuseID: String {
        case photos = "PhotosCollectionViewCell_ReuseID"
    }
    
    private func collectionViewLayout() {
        view.addSubview(collectionView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
        ])
    }
    
    private func TuneCollectionView() {
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: reuseID.photos.rawValue)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
//    @objc func deleteSub() {
//        imagePublisherFacade.removeSubscription(for: self)
//    }

}
    
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosStorage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID.photos.rawValue, for: indexPath) as! PhotosCollectionViewCell
       
        let photo = photosStorage[indexPath.row]
        cell.congigure(with: photo)
//        cell.congigure(with: photoCollection)

        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegate {
    
}

//extension PhotosViewController: ImageLibrarySubscriber {
//    func receive(images: [UIImage]) {
//        photoCollection = images
//        imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 10, userImages: photoCollection)
//        collectionView.reloadData()
//    }
//}
