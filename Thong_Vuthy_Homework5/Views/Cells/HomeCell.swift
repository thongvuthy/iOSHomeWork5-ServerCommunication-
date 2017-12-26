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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("hello")
        // Configure the view for the selected state
    }
    
    func configureCell(article : Article){
        print("works")
        
         let url = URL(string: article.image!)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //
        self.thumnail.image = UIImage(data:data!)
    //    self.thumnail.kf.setImage(with: article.image! as? Resource)
        self.headline.text = article.title!
        self.viewText.text = "1335 Views"
        self.dateText.text = article.createdDate
    }
    
}
