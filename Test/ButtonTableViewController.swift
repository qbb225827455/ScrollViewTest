//
//  ButtonViewController.swift
//  Test
//
//  Created by 陳鈺翔 on 2022/10/10.
//

import UIKit

protocol ButtonTableViewControllerDelegate: AnyObject {
    func tableViewDidScroll(_ tableView: ButtonTableViewController, translation: CGFloat)
}

class ButtonTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let imageHeight: CGFloat = 300.0
    let cellCount = 100
    var buttonStatus: [Bool] = []

    weak var delegate: ButtonTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStatus = Array(repeating: false, count: cellCount)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets(top: imageHeight, left: 0, bottom: 0, right: 0)
    }
}

extension ButtonTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return cellCount
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.delegate = self
        cell.button.setTitle("Button-\(indexPath.row + 1)", for: .normal)
        cell.configButtonColor(status: self.buttonStatus[indexPath.row])
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let translation = scrollView.contentOffset.y + imageHeight

        self.delegate?.tableViewDidScroll(self, translation: translation)
    }
}

extension ButtonTableViewController: buttonStatusDelegate {
    func getCellandStatus(cell: TableViewCell, status: Bool) {
        let indexPathRow = self.tableView.indexPath(for: cell)?.row
        self.buttonStatus[indexPathRow!] = status
    }
}
