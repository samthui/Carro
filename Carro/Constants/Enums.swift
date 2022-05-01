//
//  Enums.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

enum Country: String, Codable, CaseIterable {
    case Singapore, Thailand
}

enum UserDefaultsKeys: String, Codable {
    case Country
}
