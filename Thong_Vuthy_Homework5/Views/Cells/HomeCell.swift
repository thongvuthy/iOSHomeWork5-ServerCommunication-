//
//  HomeCell.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 24/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    
    @IBOutlet weak var viewText: UILabel!
    @IBOutlet weak var dateImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("hello")
        // Configure the view for the selected state
    }

}
