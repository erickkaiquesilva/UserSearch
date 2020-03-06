//
//  ErrorViewController.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    
    @IBOutlet weak var errorWarning: UILabel!
    var textWarning: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    func bindData() {
        errorWarning.text = "OPS!!! Error: \(textWarning ?? "")"
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
