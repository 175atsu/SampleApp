//
//  ViewController.swift
//  TableView
//
//  Created by 飯野敦博 on 2018/09/09.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    var receiveData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = receiveData
    }
}

