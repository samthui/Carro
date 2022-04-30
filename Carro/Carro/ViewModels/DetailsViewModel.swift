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
    
    func getData() {
        AF.request(Constants.kEndpoint).validate().responseDecodable(of: Response.self) { (result) in
            print(result)
        guard let response = result.value else { return }
            self.data = response.data
  //      self.items = films.all
  //      self.tableView.reloadData()
      }
    }
}

