//
//  MainViewController.swift
//  OverridableExample
//
//  Created by Vincent PRADEILLES on 16/10/2016.
//  Copyright © 2016 Vincent PRADEILLES. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = OverridableImage(named: "icon-welcome")
        self.label.text = OverridableLocalizedString(key: "Welcome!")
    }
    
}
