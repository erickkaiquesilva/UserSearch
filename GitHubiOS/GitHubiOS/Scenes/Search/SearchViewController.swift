//
//  SearchViewController.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchViewControllerProtocol {
    
    @IBOutlet weak var InputName: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    var presenterSearch: SearchPresenterProtocol = SearchPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterSearch.controller = self
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        presenterSearch.validateData(InputName.text)
    }
    
    func showDetail(_ user: User, repositores: [Repositores]) {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            destinationVC.userModel = user
            destinationVC.repositoresModel = repositores
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    func errorView(_ error: String) {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as? ErrorViewController {
            destinationVC.textWarning = error
            self.navigationController?.present(destinationVC, animated: true, completion: nil)
        }
    }
}
