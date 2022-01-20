//
//  ViewController.swift
//  CryptoAppMVVM
//
//  Created by Mac on 20.01.2022.
//

import UIKit
////https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json
class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
 
    @IBOutlet weak var tblTableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.colorArray = [
            UIColor(red: 10/255, green: 55/255, blue: 67/255, alpha: 1.0),
            UIColor(red: 105/255, green: 77/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 60/255, green: 150/255, blue: 120/255, alpha: 1.0),
            UIColor(red: 55/255, green: 88/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 140/255, green: 99/255, blue: 64/255, alpha: 1.0),
            UIColor(red: 100/255, green: 18/255, blue: 15/255, alpha: 1.0)
        ]
        tblTableView.delegate = self
        tblTableView.dataSource = self
        getData()
    }
    func getData() {
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { (cryptoList) in
            if let cryptoList = cryptoList {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoList)
                DispatchQueue.main.async {
                    self.tblTableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.lblCellName.text = cryptoViewModel.name
        cell.lblCellPrice.text = cryptoViewModel.price
        cell.backgroundColor = self.colorArray[indexPath.row%6]
        return cell
    }

}

