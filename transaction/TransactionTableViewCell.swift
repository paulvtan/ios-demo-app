//
//  TransactionTableViewCell.swift
//  transaction
//
//  Created by Paul Tanchareon on 28/11/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func setTransaction(transaction: Transaction) {
        idLabel.text = transaction.id
        summaryLabel.text = transaction.summary
    }
    
}
