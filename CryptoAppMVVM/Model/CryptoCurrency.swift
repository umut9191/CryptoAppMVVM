//
//  CryptoCurrency.swift
//  CryptoAppMVVM
//
//  Created by Mac on 20.01.2022.
//

import Foundation
// Codable= Decodable(get) + Encodable(post)
struct CryptoCurrency : Decodable {
    // these variable names must be exactly same on service json fields
    let currency : String
    let price : String
}
