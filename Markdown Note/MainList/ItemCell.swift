//
//  ItemCell.swift
//  Markdown Note
//
//  Created by 謝佳瑋 on 2017/8/30.
//  Copyright © 2017年 謝佳瑋. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tagView.layer.cornerRadius = tagView.frame.height/2
        tagView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
