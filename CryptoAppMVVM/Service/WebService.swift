//
//  WebService.swift
//  CryptoAppMVVM
//
//  Created by Mac on 20.01.2022.
//

import Foundation

class Webservice  {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?)->()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                do {
                 let cryptoList =  try JSONDecoder().decode([CryptoCurrency].self, from: data)
                        completion(cryptoList)
                } catch  {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}
