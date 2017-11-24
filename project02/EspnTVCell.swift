//
//  EspnTVCell.swift
//  project02
//
//  Created by Abhi Singh on 10/16/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class EspnTVCell: UITableViewCell {

    
    @IBOutlet weak var espnImage: UIImageView!
    @IBOutlet weak var espnTitle: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
