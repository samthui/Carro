//
//  AlamoFireAdaptor.swift
//  Carro
//
//  Created by N T P Ngoc on 02/05/2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    // Throw when response doesnt have value
    case invalidResponse

    // Throw in all other cases
    case unexpected(code: Int)
}

class AlamoFireAdaptor: NetworkInterface {
    static func request(_ endpoint: String!, onSuccess: @escaping (Any) -> Void, onError: @escaping (Error) -> Void) {
        AF.request(endpoint).validate().responseDecodable(of: Response.self) { (result) in
            guard let response = result.value else {
                onError(NetworkError.invalidResponse)
                return
            }
            
            onSuccess(response.data)
        }
    }
}
