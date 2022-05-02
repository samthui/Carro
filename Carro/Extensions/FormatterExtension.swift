//
//  FormatterExtension.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

extension NumberFormatter {
    func formatCurrency(_ value: Double) -> String! {
        self.currencySymbol = Constants.kCurrencySymbol
        self.usesGroupingSeparator = true
        self.numberStyle = .currency
        self.locale = Locale.current

        let number = NSNumber(value: value)
        return self.string(from: number)!
    }
}
