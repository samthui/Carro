//
//  SettingsViewController.swift
//  Carro
//
//  Created by N T P Ngoc on 28/04/2022.
//

import UIKit
import RadioGroup

class SettingsViewController: UIViewController {
    @IBOutlet weak var countriesRadioGroup: RadioGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCountriesRadioGroup()
    }
    
    func setupCountriesRadioGroup() {
        let titles = Country.allCases.map { $0.rawValue }
        countriesRadioGroup.titles = titles
        countriesRadioGroup.selectedIndex = titles.firstIndex(of: Constants.kDefaultCountry.rawValue) ?? -1
        countriesRadioGroup.addTarget(self, action: #selector(didSelectOption(radioGroup:)), for: .valueChanged)
    }

    @objc func didSelectOption(radioGroup: RadioGroup) {
        print(radioGroup.titles[radioGroup.selectedIndex] ?? "")
        UserDefaults.standard.set(radioGroup.titles[radioGroup.selectedIndex] ?? Constants.kDefaultCountry.rawValue, forKey: UserDefaultsKeys.Country.rawValue)
    }

}

