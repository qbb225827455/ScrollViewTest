//
//  TableViewCell.swift
//  Test
//
//  Created by 陳鈺翔 on 2022/10/10.
//

import UIKit

protocol buttonStatusDelegate: AnyObject {
    func getCellandStatus(cell: TableViewCell, status: Bool)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: buttonStatusDelegate?
    
    @IBOutlet var button: UIButton! {
        didSet {
            button.backgroundColor = .black
            button.tintColor = .white
        }
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        switch sender.backgroundColor {
        case UIColor.red:
            sender.backgroundColor = .black
            delegate?.getCellandStatus(cell: self, status: false)
            
        case UIColor.black:
            sender.backgroundColor = .red
            delegate?.getCellandStatus(cell: self, status: true)
        default:
            break
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configButtonColor(status: Bool) {
        if status {
            self.button.backgroundColor = .red
        } else {
            self.button.backgroundColor = .black
        }
    }
}
