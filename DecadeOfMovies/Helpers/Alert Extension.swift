//
//  Alert Extension.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorMessage(with message: String, completion: (()->())? = nil) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (alert) in
            completion?()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
