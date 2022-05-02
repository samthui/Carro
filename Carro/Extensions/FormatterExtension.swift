//
//  FormatterExtension.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

extension NumberFormatter {
    static func formatCurrency(_ value: Double) -> String! {
        let formatter = NumberFormatter()
        
        formatter.currencySymbol = Constants.kCurrencySymbol
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")

        let number = NSNumber(value: value)
        return formatter.string(from: number)!
    }
}
