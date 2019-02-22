//
//  SettingViewController.swift
//  MyTimer
//
//  Created by 飯野敦博 on 2018/11/30.
//  Copyright © 2018 mycompany. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //UIPickerViewに表示するデータをArrayで作成
    let settingArray : [Int] = [10,20,30,40,50,60]
    
    //設定値を覚えるキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //timerSettingPickerのデリゲートとデータソースの通知先を指定
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        //UserDefaultsの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        //Pickerの選択を合わせる
        for row in 0..<settingArray.count {
            if settingArray [row] == timerValue{
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
        
    }

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    @IBAction func decisionButtonAction(_ sender: Any) {
        //前画面に戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    //UIPickerViewの列数を設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //UIPickerViewの行数を取得
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    
    //UIPckerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    
    //picker選択時に実行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //UserDefaultsの設定
        let setting = UserDefaults.standard
        setting.setValue(settingArray[row], forKey: settingKey)
        setting.synchronize()
    }
    
}