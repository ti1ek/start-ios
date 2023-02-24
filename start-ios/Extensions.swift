//
//  Extensions.swift
//  start-ios
//
//  Created by Zhuldyz Bukeshova on 24.02.2023.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftIcon(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 7, width: 20, height: 15))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
