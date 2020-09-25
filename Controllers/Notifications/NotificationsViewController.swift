//
//  NotificationsViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class NotificationModal{
    
    var notificationImage: UIImage?
    var notificationMessage: String?
    
    init(notificationImage: UIImage, notificationMessage: String ) {
        self.notificationImage = notificationImage
        self.notificationMessage = notificationMessage
    }
}

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    // MARK: - Properties
    let tableView = UITableView()
    
    var notificationArray = [NotificationModal]()
        
    // MARK: - Lifecycale

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Notifications"
        view.backgroundColor = .black
        setTableView()
        
        notificationArray.append(NotificationModal(notificationImage: #imageLiteral(resourceName: "gold-bell-icon-png-image-transparent-background"), notificationMessage: "NIBM Closed until further notice"))
        notificationArray.append(NotificationModal(notificationImage: #imageLiteral(resourceName: "gold-bell-icon-png-image-transparent-background"), notificationMessage: "Must wear a mask"))
        notificationArray.append(NotificationModal(notificationImage: #imageLiteral(resourceName: "gold-bell-icon-png-image-transparent-background"), notificationMessage: "Sanitize when entering NIBM"))
    }
    
    // MARK: - Functions
    
    func setTableView()  {
        
        tableView.frame = self.view.frame
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        tableView.backgroundColor = .black
        
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NotificationTableViewCell else {fatalError("Unable to create the cell")}
        cell.notificationImage.image = notificationArray[indexPath.row].notificationImage
        cell.notificatonLabel.text = notificationArray[indexPath.row].notificationMessage
                return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}
