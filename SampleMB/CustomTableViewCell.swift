//
//  CustomTableViewCell.swift
//  SampleMB
//
//  Created by KSF on 2016/10/20.
//  Copyright © 2016年 KSF. All rights reserved.
//

//import Cocoa
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
