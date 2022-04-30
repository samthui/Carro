//
//  DataModel.swift
//  Carro
//
//  Created by N T P Ngoc on 30/04/2022.
//

import Foundation

struct DataModel: Decodable {
    let id: Int
    let make: String
    let model: String
    let carplateNumber: String
    let totalFines: Int?
    let totalFinesAmount: Double?
    let totalPerKmRate: String
    let daysLeft: Int?
    let startTime: Double
    let endTime: Double
    let drivenThisMonth: Int
    let usageDueThisMonth: Int
    let basePrice: Double?
    let roadTax: Double
    let insuranceExcess: Double
    let updatedAt: Double
    let drivers: [DriverModel]
  
  enum CodingKeys: String, CodingKey {
    case id
    case make
    case model
    case carplateNumber = "carplate_number"
    case totalFines = "total_outstanding_fine_count"
    case totalFinesAmount = "total_outstanding_fine_amount"
    case totalPerKmRate = "total_per_km_rate"
    case daysLeft = "days_left"
    case startTime = "start_time"
    case endTime = "end_time"
    case drivenThisMonth = "driven_this_month"
    case usageDueThisMonth = "usage_due_this_month"
    case basePrice = "base_price"
    case roadTax = "road_tax"
    case insuranceExcess = "insurance_excess"
    case updatedAt = "updated_at"
    case drivers
  }
}
