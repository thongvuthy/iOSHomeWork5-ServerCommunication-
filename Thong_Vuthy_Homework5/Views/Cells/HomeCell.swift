//
//  HomeCell.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 24/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit
import Kingfisher 
class HomeCell: UITableViewCell {
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    
    @IBOutlet weak var viewText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var dateImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        saveButton.layer.cornerRadius = 5.0
        saveButton.layer.borderColor = UIColor.darkGray.cgColor
        saveButton.layer.borderWidth =  1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("hello")
        // Configure the view for the selected state
    }
    
    func configureCell(article : Article){

        if let string = article.image {
//        let url = URL(string: string)
//        let data = try? Data(contentsOf: url!)
    
            self.thumnail.kf.setImage(with: URL(string: string))

    }
    //    self.thumnail.kf.setImage(with: article.image! as? Resource)
        self.headline.text = article.title!
        self.viewText.text = "1335 Views"
        self.dateText.text = article.createdDate
    }
    
}
