//
//  DetailViewController.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var loginUser: UILabel!
    @IBOutlet weak var bioUser: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var userModel: User?
    var repositoresModel: [Repositores]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        bindData()
    }
    
    func bindData() {
        imageUser.setImage(from: userModel?.avatar_url)
        nameUser.text = userModel?.name
        loginUser.text = userModel?.login
        bioUser.text = userModel?.bio
    }
    
    @IBAction func newSearchBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repositores = repositoresModel {
            return repositores.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        
        let repositore  = repositoresModel?[indexPath.row]
        
        cell.textLabel?.text = repositore?.name ?? ""
        cell.detailTextLabel?.text = repositore?.language ?? ""
        
        return cell
    }
}
