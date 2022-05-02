//
//  DetailsViewModel.swift
//  Carro
//
//  Created by N T P Ngoc on 30/04/2022.
//

import Foundation
import Alamofire
import UIKit

enum NetworkState {
    case none, loading, succeed, error
}

protocol DetailsViewModelDelegate {
    func updateNetworkState(_ state: NetworkState)
}

class DetailsViewModel {
    private var delegate: DetailsViewModelDelegate!
    private var networkLayer: NetworkInterface!
    private var data: DataModel?
    private var state: NetworkState = .none {
        didSet {
            delegate.updateNetworkState(state)
        }
    }
    
    init(_ delegate: DetailsViewModelDelegate, networkLayer: NetworkInterface) {
        self.delegate = delegate
        self.networkLayer = networkLayer
    }
    
    
    
    var model: String {
        get { return data!.model }
    }
    
    var carplateNumber: String {
        get { return data!.carplateNumber }
    }
    
    var daysLeft: String {
        get {
            let days = data!.daysLeft ?? 0
            return "\(days) day\(days > 1 ? "s" : "") left"
        }
    }
    
    var progress: Float {
        get {
            let days = data!.daysLeft ?? 0
            let totalDays = Calendar.current.numberOfDaysBetweenTimestamp(data!.startTime, and: data!.endTime)
            
            return Float(days)/Float(totalDays)
        }
    }
    
    var drivenThisMonth: NSAttributedString {
        get {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = true
            formatter.positiveSuffix = Constants.kLengthUnit

            let number = NSNumber(value: data!.drivenThisMonth)
            let originalString = formatter.string(from: number)!
            return Utils.attributeMeasurement(originalString, unit: Constants.kLengthUnit)
        }
    }
    
    var usageDueThisMonth: NSAttributedString {
        get {
            let originalString = NumberFormatter.formatCurrency(Double(data!.usageDueThisMonth))!
            return Utils.attributeMeasurement(originalString, unit: Constants.kCurrencySymbol)
        }
    }
    
    var lastUpdated: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = Constants.kDateFormat
            formatter.locale = Locale.current
            
            return "last updated: \(formatter.string(from: Date(timeIntervalSince1970: data!.updatedAt)))"
        }
    }
    
    var basePrice: String {
        get {
            return "\(NumberFormatter.formatCurrency(data!.basePrice ?? 0.0) ?? "$0.00")/month"
        }
    }
    
    var roadTax: String {
        get {
            return NumberFormatter.formatCurrency(data!.roadTax)
        }
    }
    
    var usageBasedInsurance: String {
        get {
            let number = (data!.totalPerKmRate as NSString).doubleValue
            return "\(NumberFormatter.formatCurrency(number) ?? "$0.00")/km"
        }
    }
    
    var nameDriver: String {
        get {
            return data!.drivers[0].name
        }
    }
    
    var totalFines: String {
        get {
            guard let value = data!.totalFines else {
                return "0"
            }
            return "\(value)"
        }
    }
    
    var totalFinesAmount: String {
        get {
            guard let value = data!.totalFinesAmount else {
                return NumberFormatter.formatCurrency(0.0)
            }
            
            return NumberFormatter.formatCurrency(value)
        }
    }
    
    var insuranceExcess: String {
        get {
            return NumberFormatter.formatCurrency(data!.insuranceExcess)
        }
    }
    
    
    func getData(_ completion: @escaping () -> Void) {
        state = .loading
        
        networkLayer.request(Constants.kEndpoint, onSuccess: { data in
            self.state = .succeed
            self.data = data as! DataModel?
            completion()
        }, onError: { error in
            self.state = .error
        })
    }
}

