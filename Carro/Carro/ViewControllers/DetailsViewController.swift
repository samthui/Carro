//
//  DetailsViewController.swift
//  Carro
//
//  Created by N T P Ngoc on 30/04/2022.
//

import Foundation
import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var carplateNumberLabel: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var drivenThisMonthLabel: UILabel!
    @IBOutlet weak var usageDueThisMonthLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    
    @IBOutlet weak var basePriceLabel: UILabel!
    @IBOutlet weak var roadTaxLabel: UILabel!
    @IBOutlet weak var usageBasedInsuranceLabel: UILabel!
    @IBOutlet weak var nameDriverLabel: UILabel!
    @IBOutlet weak var totalFinesLabel: UILabel!
    @IBOutlet weak var totalFinesAmountLabel: UILabel!
    @IBOutlet weak var insuranceExcessLabel: UILabel!
    
    
        let viewModel: DetailsViewModel = DetailsViewModel();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    func updateUI() {
        modelLabel.text = viewModel.model
        carplateNumberLabel.text = viewModel.carplateNumber
        daysLeftLabel.text = viewModel.daysLeft
        progressBar.progress = viewModel.progress
        drivenThisMonthLabel.text = viewModel.drivenThisMonth
        usageDueThisMonthLabel.text = viewModel.usageDueThisMonth
        lastUpdatedLabel.text = viewModel.lastUpdated
        basePriceLabel.text = viewModel.basePrice
        roadTaxLabel.text = viewModel.roadTax
        usageBasedInsuranceLabel.text = viewModel.usageBasedInsurance
        nameDriverLabel.text = viewModel.nameDriver
        totalFinesLabel.text = viewModel.totalFines
        totalFinesAmountLabel.text = viewModel.totalFinesAmount
        insuranceExcessLabel.text = viewModel.insuranceExcess
    }
}

// MARK: - Query data
extension DetailsViewController {
  func getData() {
      viewModel.getData {[weak self] in
          DispatchQueue.main.async {
              self?.updateUI()
          }
      }
    }
}

