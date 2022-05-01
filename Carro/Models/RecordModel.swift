//
//  RecordModel.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

struct RecordModel: Decodable {
  let key: String
  let label: String
    
  enum CodingKeys: String, CodingKey {
    case key
    case label
  }
}
