//
//  ButtonCuston.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 04/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ButtonCustom: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
