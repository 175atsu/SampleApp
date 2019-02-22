//
//  ViewController.swift
//  Gatya
//
//  Created by 飯野敦博 on 2018/10/23.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //変数の言葉
    var number = 0
    @IBOutlet weak var ookamiImageView: UIImageView!
    @IBOutlet weak var gachaButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初期設定
        ookamiImageView.image = nil
        //角を丸くする
        gachaButton.layer.cornerRadius = gachaButton.bounds.height/2
        gachaButton.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapgachaButton(){
        
        //ガチャのアルゴリズム
        //arc4random_uniform(100)は0~99までの乱数
        number = Int(arc4random_uniform(100))
        if number < 25 {
            ookamiImageView.image = UIImage(named:"chasing_the_Horizon.jpg")
        }else if number >= 25 && number < 50{
            ookamiImageView.image = UIImage(named:"Memories.jpeg")
        }else  if number >= 50 && number < 75{
            ookamiImageView.image = UIImage(named: "TakeMeUnder.jpg")
        }else {
            ookamiImageView.image = UIImage(named: "The_World's_On_Fire.jpg")
        }
        
        //アニメーション
        //透明度 alpha 0から1へ
        ookamiImageView.alpha = 0.0
        //withDurationは1秒間かけて
        UIImageView.animate(withDuration: 2.0){
            self.ookamiImageView.alpha = 1.0
       }
    }
    


}

