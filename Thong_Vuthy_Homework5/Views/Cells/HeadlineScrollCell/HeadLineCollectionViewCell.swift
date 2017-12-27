//
//  CollectionViewCell.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 25/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit
import Kingfisher
class HeadLineCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageHeadline: UIImageView!
    
    @IBOutlet weak var labelHeadline: UILabel!
    
    func configureCell(imageString : String?, labelHeadline : String?) {
        self.labelHeadline.text = labelHeadline
        if let string = imageString {
        let url = URL(string: string)
           imageHeadline.kf.setImage(with: url)
        }
    }
}
