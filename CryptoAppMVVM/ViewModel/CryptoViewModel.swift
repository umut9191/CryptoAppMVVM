//
//  CryptoViewModel.swift
//  CryptoAppMVVM
//
//  Created by Mac on 21.01.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
}
extension CryptoListViewModel{
    func numberOfRowsInSection()->Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index:Int)->CryptoViewModel  {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return cryptoCurrency.currency
    }
    var price : String {
        return cryptoCurrency.price
    }
}

//an example; String extension

//extension String{
//    func printMyName() {
//       print("umt")
//  }
//}


