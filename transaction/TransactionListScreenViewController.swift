//
//  TransactionListScreenViewController.swift
//  transaction
//
//  Created by Paul Tanchareon on 27/11/21.
//

import UIKit

class TransactionListScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON {
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = transactions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionTableViewCell
        
        cell.setTransaction(transaction: transaction)
        
        return cell
    }
    
    // Test mock transaction data.
    func createArray() -> [Transaction] {
        var transactions: [Transaction] = []
        let transaction1 = Transaction(id: "1", transactionDate: "28-11-2021", summary: "First transaction", debit: 20, credit: 200)
        let transaction2 = Transaction(id: "2", transactionDate: "30-12-2021", summary: "Second transaction", debit: 10, credit: 250)
        transactions.append(transaction1)
        transactions.append(transaction2)
        return transactions
    }
    
    func fetchJSON(completed: @escaping () -> ()) {
        let DomainURL = "https://60220907ae8f8700177dee68.mockapi.io/api/v1/"
        let urlString = DomainURL + "transactions/"
        
        let url = URL(string: urlString)
        print(urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.transactions = try JSONDecoder().decode([Transaction].self, from: data!)
                DispatchQueue.main.async {
                    completed()
                }
            } catch {
                print("JSON Error")
            }
        }.resume()
    }
}


class Transaction: Codable {
    
    var id: String?
    var transactionDate: String?
    var summary: String?
    var debit: Float?
    var credit: Float?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case transactionDate
        case summary
        case debit
        case credit
    }
    
    init(id: String?, transactionDate: String?, summary: String?, debit: Float?, credit: Float?) {
        self.id = id
        self.transactionDate = transactionDate
        self.summary = summary
        self.debit = debit
        self.credit = credit
    }
}
