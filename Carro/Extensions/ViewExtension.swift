//
//  ViewExtension.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation
import UIKit

extension UIView {
    func selfRemove() {
        self.isHidden = true
        self.removeFromSuperview()
    }
}
