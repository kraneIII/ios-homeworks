import UIKit


class ProfileViewController: UIViewController {
        
    fileprivate let post = UserPost.userPost()
    
    //MARK: - TableView Init
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero , style: .plain    
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private enum CellReuseID: String {
        case post = "PostTableViewCell_ReuseID"
        case header = "HeaderTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        addSubViews()
        tableViewLayout()
        tuneTableView()
        
    }
    
    
    // MARK: - Setup
    
    private func setupViewController () {
        view.backgroundColor = .systemGray6
        navigationItem.title = "ProfileUsingTableView"
        title = "Profile"
    }
    
    private func addSubViews() {
        view.addSubview(tableView)
    }
    
    // MARK: - TableViewLayout
    
    private func tableViewLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
                
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
        ])
    }
    
    // MARK: - TuneTableView
    
    private func tuneTableView() {

        tableView.tableFooterView = UIView()
                
        tableView.register(PostCell.self, forCellReuseIdentifier: CellReuseID.post.rawValue)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: CellReuseID.header.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}
    //MARK: - Extensions
     
     extension ProfileViewController: UITableViewDataSource {
         
         //MARK: - CustomHeader
         
         func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
             if section == 0{
                 guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellReuseID.header.rawValue) as? ProfileHeaderView else{fatalError("header failed")}
                 
                 return headerView
             }
             return nil
         }
         
         
         func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
             return 210
         }
         
         
         //MARK: - CustomCell
         
         func numberOfSections(in tableView: UITableView) -> Int {
             1
             
         }
         
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             post.count
         }
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.post.rawValue , for: indexPath) as? PostCell
             else{return UITableViewCell()}
             
             cell.configure(userPostInfo: post[indexPath.row])
             
             return cell
         }
     }

     extension ProfileViewController: UITableViewDelegate{
     }





