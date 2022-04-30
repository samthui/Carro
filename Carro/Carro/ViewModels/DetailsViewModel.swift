//
//  DetailsViewModel.swift
//  Carro
//
//  Created by N T P Ngoc on 30/04/2022.
//

import Foundation
import Alamofire

class DetailsViewModel {
    private var data: DataModel?
    
    var model: String {
        get { return data!.model }
    }
    
    var carplateNumber: String {
        get { return data!.carplateNumber }
    }
    
    var daysLeft: String {
        get {
            guard let days = data!.daysLeft else {
                return "unknown days left"
            }
            
            return "\(days) day\(days > 1 ? "s" : "") left"
        }
    }
    
    var progress: Float {
        get {
            guard let days = data!.daysLeft else {
                return 0.0
            }
            
            let totalDays = Calendar.current.numberOfDaysBetweenTimestamp(data!.startTime, and: data!.endTime)
            
            return Float(days)/Float(totalDays)
        }
    }
    
    var drivenThisMonth: String {
        get {
            let unit = " \(Constants.kLengthUnit)"

            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = true
            formatter.positiveSuffix = unit

////            let number = NSNumber(value: data!.usageDueThisMonth)
            let number = NSNumber(value: 8562)
            return formatter.string(from: number)!
            
//            let formatter = MeasurementFormatter()
//            let length = Measurement(value: 9080, unit: )
//
//            return formatter.string(from: <#T##Measurement<Unit>#>)
        }
    }
    
    var usageDueThisMonth: String {
        get {
            let formatter = NumberFormatter()
            formatter.currencySymbol = Constants.kCurrencySymbol
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.locale = Locale.current

            let number = NSNumber(value: data!.drivenThisMonth)
//            let number = NSNumber(value: 15135)
            return formatter.string(from: number)!
        }
    }
    
    var lastUpdated: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = Constants.kDateFormat
            formatter.locale = Locale.current
            
            return formatter.string(from: Date(timeIntervalSince1970: data!.updatedAt))
        }
    }
    
    
    func getData(_ completion: @escaping () -> Void) {
        AF.request(Constants.kEndpoint).validate().responseDecodable(of: Response.self) { (result) in
        print(result)
            guard let response = result.value else { return }
            self.data = response.data
            completion()
        }
    }
}
