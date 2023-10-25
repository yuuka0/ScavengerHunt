//
//  UIColorExtension.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/02/26.
//

import UIKit

extension UIColor {

    var textColor: UIColor {
        let ciColor = CIColor(color: self)

        let red = ciColor.red * 255
        let green = ciColor.green * 255
        let blue = ciColor.blue * 255

        if (red * 0.299 + green * 0.587 + blue * 0.114) < 186 {
            return .white
        } else {
            return .black
        }
    }
}
