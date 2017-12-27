//
//  DetailViewController.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 25/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageHeadline: UIImageView!
    @IBOutlet weak var titleHeadline: UILabel!
    @IBOutlet weak var datePublished: UILabel!
    @IBOutlet weak var numberOfViews: UILabel!
    @IBOutlet weak var textArticle: UITextView!
    
    var article : Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let string = article?.image {
            let url = URL(string: string)
            let data = try? Data(contentsOf: url!)
            imageHeadline.image = UIImage(data: data!)
        }
        
        numberOfViews.text = "23455 Views"
       
        titleHeadline.text = article?.title
        datePublished.text = article?.createdDate
        textArticle.text = article?.desc
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
