//
//  TextFieldCustom.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 04/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class TextFieldCustom: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 1
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
