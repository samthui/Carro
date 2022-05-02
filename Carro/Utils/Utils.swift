//
//  Utils.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation
import UIKit

class Utils {
    /**
     Requirements: given a measurement string, e.g "100km"; display it:
        - color: orange
        - "100": fontSize = 30
        - "km" is the unit of measurement: fontSize = 17
     */
    static func attributeMeasurement(_ string: String, unit: String) -> NSAttributedString! {
        let mainAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.orange, .font: UIFont.systemFont(ofSize: 30)]
        let attributtedString = NSMutableAttributedString(string: string, attributes: mainAttribute)
        
        let unitAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 17)]
        let unitRange = (string as NSString).range(of: "\(unit)")
        attributtedString.addAttributes(unitAttribute, range: unitRange)
        return attributtedString
    }
}
