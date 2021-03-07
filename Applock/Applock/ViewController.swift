//
//  ViewController.swift
//  Applock
//
//  Created by Sourabh Goyal on 07/03/21.
//  Copyright © 2021 himanshu. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func authorizeTapped (_ sender : UIButton) {
        
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reson = "Please Authorise with touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reson) { [weak self] success, error in
                DispatchQueue.main.async {
                     guard success, error == nil else {
                        
                        
                        let alert = UIAlertController(title: "Failed", message: "Try Again", preferredStyle: .alert)
                                   
                                   alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
                                   
                                   self?.present(alert, animated: true)
                                       return
                }
                    // show success
                    
                    let alert = UIAlertController(title: "Success", message: "We got matched", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
                    self?.present(alert, animated: true)
                }
            }
        }
        else {
            
            let alert = UIAlertController(title: "Unavialble", message: "You can't use this", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
        }
        
    }

}

