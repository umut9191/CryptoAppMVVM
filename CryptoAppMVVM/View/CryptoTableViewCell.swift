//
//  CryptoTableViewCell.swift
//  CryptoAppMVVM
//
//  Created by Mac on 20.01.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCellName: UILabel!
    @IBOutlet weak var lblCellPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
