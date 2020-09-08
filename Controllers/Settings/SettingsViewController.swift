
import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    private let buttonLogout: UIButton = {
        
        let button = LogoutUIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleOnClickLogout), for: .touchUpInside)
        return button
    }()
    
    private let buttonProfile: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Profile", for: .normal)
        button.tintColor = .orange
        button.semanticContentAttribute = .forceRightToLeft
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(handleOnClickProfile), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        return button
    }()
    
    private let buttonShare: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Share with a friend", for: .normal)
        button.tintColor = .orange
        //button.setImage(#imageLiteral(resourceName: "home (3)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(handleOnClickShare), for: .touchUpInside)
        return button
    }()
    
    private let buttonContact: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Contact us / About us", for: .normal)
        button.tintColor = .orange
        //button.setImage(#imageLiteral(resourceName: "home (3)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(handleOnClickContact), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: Methods
    
    func configureUI(){
        
        view.backgroundColor = .black
        title = "Settings"
        
        let bottomNavigationStackView = UIStackView(arrangedSubviews: [buttonLogout])
        view.addSubview(bottomNavigationStackView)
        
        NSLayoutConstraint.activate([
            bottomNavigationStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomNavigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomNavigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomNavigationStackView.heightAnchor.constraint(equalToConstant: 50)])
        
        bottomNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationStackView.distribution = .fillEqually
        
        let middleNavigationStackView = UIStackView(arrangedSubviews: [buttonProfile, buttonContact, buttonShare])
        view.addSubview(middleNavigationStackView)
        
        NSLayoutConstraint.activate([
            middleNavigationStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            middleNavigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            middleNavigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            middleNavigationStackView.heightAnchor.constraint(equalToConstant: 150)])
        
        middleNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        middleNavigationStackView.axis = .vertical
        middleNavigationStackView.distribution = .fillEqually
        
    }
    
    
    @objc func handleOnClickShare(){
        
        let vc = QuestionOneViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickContact(){
        
        let vc = AboutUsViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickProfile(){
        
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickLogout(){
        
        signOut()
        let vc = HomeScreenViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }
    
}
