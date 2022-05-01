//
//  Response.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

struct Response: Decodable {
  let data: DataModel
    
  enum CodingKeys: String, CodingKey {
    case data
  }
}
