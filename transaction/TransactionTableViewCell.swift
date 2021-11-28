//
//  TransactionTableViewCell.swift
//  transaction
//
//  Created by Paul Tanchareon on 28/11/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func setTransaction(transaction: Transaction) {
        transactionDateLabel.text = transaction.transactionDate
        summaryLabel.text = transaction.summary
    }
}
