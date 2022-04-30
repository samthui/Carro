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
//    let viewModel: DetailsViewModel = DetailsViewModel();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }


}

// MARK: - Alamofire
extension DetailsViewController {
    
  func getData() {
      AF.request(Constants.kEndpoint).validate().responseDecodable(of: Response.self) { (result) in
          print(result)
      guard let response = result.value else { return }
    }
  }
    
    
//  func getData() {
//      AF.request(Constants.kEndpoint).validate().responseDecodable(of: Response.self) { (result) in
//          print(result)
//      guard let response = result.value else { return }
//    }
//  }
}
