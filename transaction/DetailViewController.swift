//
//  DetailViewController.swift
//  transaction
//
//  Created by Paul Tanchareon on 28/11/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var debitLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var gstLabel: UILabel!
    
    var transaction: Transaction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionDateLabel.text = (transaction?.transactionDate)!
        summaryLabel.text = transaction?.summary
        debitLabel.text = "Debit: $" + String(describing: (transaction?.debit)!)
        creditLabel.text = "Credit: $" + String(describing: (transaction?.credit)!)
        let gst = 0.15 * (transaction?.debit)!
        gstLabel.text = "GST Paid: $" + String(describing: gst)
    }
}
