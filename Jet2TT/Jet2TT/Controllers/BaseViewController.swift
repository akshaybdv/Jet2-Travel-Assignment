//
//  BaseViewController.swift
//  Jet2TT
//
//  Created by Badve, Akshay on 6/21/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// Comman method to show alert in any view controller
    /// - Parameters:
    ///   - title: Title which user wants to see
    ///   - message: Message which user wants to see
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: Constants.Alerts.okay, style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
