//
//  NetworkInterface.swift
//  Carro
//
//  Created by N T P Ngoc on 02/05/2022.
//

import Foundation

protocol NetworkInterface {
    func request(_ endpoint: String!, onSuccess: @escaping (_ data: Any) -> Void, onError: @escaping (_ error: Error) -> Void)
}
