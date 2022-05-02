//
//  DetailsViewModel.swift
//  Carro
//
//  Created by N T P Ngoc on 30/04/2022.
//

import Foundation
import Alamofire

enum NetworkState {
    case none, loading, succeed, error
}

protocol DetailsViewModelDelegate {
    func updateNetworkState(_ state: NetworkState)
}

class DetailsViewModel {
    private var delegate: DetailsViewModelDelegate!
    private var data: DataModel?
    private var state: NetworkState = .none {
        didSet {
            delegate.updateNetworkState(state)
        }
    }
    
    init(_ delegate: DetailsViewModelDelegate) {
        self.delegate = delegate
    }
    
    
    
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

            let number = NSNumber(value: data!.drivenThisMonth)
            return formatter.string(from: number)!
        }
    }
    
    var usageDueThisMonth: String {
        get {
            let formatter = NumberFormatter()
            return formatter.formatCurrency(Double(data!.usageDueThisMonth))
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
            let formatter = NumberFormatter()
            return "\(formatter.formatCurrency(data!.basePrice ?? 0.0) ?? "0")/month"
        }
    }
    
    var roadTax: String {
        get {
            let formatter = NumberFormatter()
            return formatter.formatCurrency(data!.roadTax)
        }
    }
    
    var usageBasedInsurance: String {
        get {
            return "$ \(data!.totalPerKmRate)/km"
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
            let formatter = NumberFormatter()
            
            guard let value = data!.totalFinesAmount else {
                return formatter.formatCurrency(0.0)
            }
            
            return formatter.formatCurrency(value)
        }
    }
    
    var insuranceExcess: String {
        get {
            let formatter = NumberFormatter()
            return formatter.formatCurrency(data!.insuranceExcess)
        }
    }
    
    
    func getData(_ completion: @escaping () -> Void) {
        state = .loading
        
        AlamoFireAdaptor.request(Constants.kEndpoint, onSuccess: { data in
            self.state = .succeed
            self.data = data as! DataModel?
            completion()
        }, onError: { error in
            self.state = .error
        })
    }
}

