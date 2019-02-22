//
//  CustomCell.swift
//  soccer_list
//
//  Created by 飯野敦博 on 2018/11/09.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var soccer_image: UIImageView!
    @IBOutlet weak var teame_name: UILabel!
    @IBOutlet weak var reaage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         //Initialization code
    }
    
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
//    
    
}
