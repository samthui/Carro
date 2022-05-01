//
//  DriverModel.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

struct DriverModel: Decodable {
  let name: String
  let phone: String
    
  enum CodingKeys: String, CodingKey {
    case name
    case phone
  }
}
