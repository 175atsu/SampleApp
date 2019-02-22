//
//  ViewController.swift
//  abc
//
//  Created by 飯野敦博 on 2018/09/14.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var TableView: UITableView!
    
    //配列fruitsを設定
    let fruits = ["apple", "orange", "melon", "banana", "pineapple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = fruits[indexPath.row]
        
        return cell
    }
    
    
}

