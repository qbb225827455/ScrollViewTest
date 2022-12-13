//
//  ViewController2.swift
//  Test
//
//  Created by 陳鈺翔 on 2022/10/10.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 50
            imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }

    var navBarHeightPlusStatusHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBarHeightPlusStatusHeight = (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        childViewConfiguration()
    }

    func childViewConfiguration() {
        guard let ButtonTableVC = self.children[0] as? ButtonTableViewController else { return }

        ButtonTableVC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController2: ButtonTableViewControllerDelegate {
    func tableViewDidScroll(_ tableView: ButtonTableViewController, translation: CGFloat) {
        let y = navBarHeightPlusStatusHeight - translation
        if y > -200 {
            self.imageView.frame = CGRect(x:0, y: y, width: self.imageView.frame.width, height: 300)
        }
    }
}

