//
//  ViewController.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 12.05.2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func girisTiklandi(_ sender: Any) {
        
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    

}

