//
//  ViewController.swift
//  Reeses
//
//  Created by Christian Guma on 6/10/19.
//  Copyright © 2019 Christian Guma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = " "
    }

    @IBAction func heyButtonPressed(_ sender: UIButton) {
        let peanutstring = "You got peanut butter in my chocolate"
        let chocolatestring = "You got chocolate in my peanut butter"
        if messageLabel.text == peanutstring {
            messageLabel.text = chocolatestring
            messageLabel.textColor = .brown
            messageLabel.textAlignment = .left
        } else {
            messageLabel.text = peanutstring
            messageLabel.textColor = .orange
            messageLabel.textAlignment = .right
            
        }
    }
    
}

