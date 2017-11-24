//
//  NewsNewsTVCell.swift
//  project02
//
//  Created by Abhi Singh on 10/18/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class NewsNewsTVCell: UITableViewCell {

    @IBOutlet weak var newsNewsImage: UIImageView!
    
    @IBOutlet weak var newsNewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
