import UIKit

class PostsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViews()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
   }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

extension PostsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Storage.tableModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if Storage.tableModel[section].type == .photos
        
        //if section == 0
        
        { return 1 }
        
        else {
            
            return Storage.tableModel[section].posts?.count ?? 0
            
        }
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            switch Storage.tableModel[indexPath.section].type {
            case .photos:
                let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
                return cell
            case .posts:
                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            
                let tableSection: PostSection = Storage.tableModel[indexPath.section]
                let post: Post = tableSection.posts![indexPath.row]
                            cell.postInScreen = post
            
                return cell
            }
            
            
            
            
//            switch indexPath.section{
//
//            case 0:
//                let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
//                return cell
//
//            default:
//                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
//
//                let tableSection: PostSection = Storage.tableModel[indexPath.section]
//                let post: Post = tableSection.posts![indexPath.row]
//                cell.postInScreen = post
//
//                return cell
//        }
    }
}

extension PostsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return .zero }
        
        let headerView = UINib(nibName: "ProfileHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ProfileHeaderView

        return headerView.frame.height
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let headerView = UINib(nibName: "ProfileHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ProfileHeaderView

        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
                switch indexPath.section {
                case 0:
                    let photosViewController = PhotosViewController()
                    
                    navigationController?.pushViewController(photosViewController, animated: true)
                default:
                    return
                }
        
        }
    
}

