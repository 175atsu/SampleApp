//
//  ViewController.swift
//  data
//
//  Created by 飯野敦博 on 2019/01/31.
//  Copyright © 2019 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //タイマー変数
    var timer : Timer?
    //カウント
    var count = 0
    //キー
    let settingKey = "timer_value"
    
    //スタート、ストップ判別
    var check = 0
    

    @IBOutlet weak var shintyoku: UILabel!
    
    @IBOutlet weak var progressview: UIProgressView!
    
    @IBOutlet weak var tapname: UIButton!
    
    @IBOutlet weak var resetname: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shintyoku.text = String(count) + "%完了"
        tapname.setTitle("スタート", for: .normal)
        resetname.setTitle("リセット", for: .normal)
    }
    
    
    @IBAction func tap(_ sender: Any) {
        
        if check == 0{
            //ボタンの名前変更
            tapname.setTitle("ストップ", for: .normal)
            //判別変更
            check = 1
            //時間
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerInterrupt(_:)), userInfo: nil, repeats: true)
            //アンラップ
            if let nowTimer = timer {
                if  nowTimer .isValid == true {
                    return
                }
            }
            
            resetname.isEnabled = false // 無効
        } else {
            tapname.setTitle("スタート", for: .normal)
            check = 0
            //アンラップ
            if let nowTimer = timer {
                if nowTimer.isValid == true {
                    nowTimer.invalidate()
                }
            }
        }
    }
    
    
    @IBAction func reeset(_ sender: Any) {
        
        if check == 0 {
            count = 0
            progressview.progress = 0
            displayUpdate()
        }
        
    }
    
    //経過時間の処理
    @objc func timerInterrupt(_ timer:Timer) {
        count += 1
        if displayUpdate() >= 100{
            timer.invalidate()
        }
    }
    
    //画面の更新
    func displayUpdate() -> Int{
        //UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        //取得した秒数をtimerValueに渡す
        let _ = settings.integer(forKey: settingKey)
        //残り時間をラベルに表示
        shintyoku.text = "\(count)%完了"
        //プログレスバー
        progressview.setProgress(Float(count)/100, animated: true)
        
        return count
        
    }

}
