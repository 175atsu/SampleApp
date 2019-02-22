//
//  ViewController.swift
//  Myjanken
//
//  Created by 飯野敦博 on 2018/06/16.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var answerImageView: UIImageView!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    //じゃんけん（数字）
    var answerNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
        
        //新しいじゃんけんの結果を一時的に格納する変数を設ける
        var newAnswerNumber = 0
        
        //ランダムに結果を繰り返すが前回と異なる場合のみ採用
        //repeatは繰り返しを意味する
        repeat{
            
            //0,1,2の数値ｗランダムに算出( 乱数)
            newAnswerNumber = Int(arc4random_uniform(3))
            
            //前回ｔ同じ結果の時は、再度、ランダムに数値を出す
            //異なる結果の時はrepeatを抜ける
        }while answerNumber == newAnswerNumber
        
        //新しいじゃんけん結果を格納
        answerNumber = newAnswerNumber
        
        
        if answerNumber == 0 {
            //グー
            answerLabel.text = "グー"
            answerImageView.image = UIImage(named: "gu")
            
        } else if answerNumber == 1{
            //チョキ
            answerLabel.text = "チョキ"
            answerImageView.image = UIImage(named: "choki")
            
        } else if answerNumber == 2{
            //パー
            answerLabel.text = "パー"
            answerImageView.image = UIImage(named: "pa")
        }
    }
}
