//
//  ViewController.swift
//  Gray Final Pizza Project
//
//  Created by logan gray on 5/4/20.
//  Copyright © 2020 logan gray. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    
 
    @IBAction func makeCall(_ sender: Any) {
    
        let url:NSURL = URL(string: "TEL://7245549112")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    
    }
    
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
       
    
    }


}


