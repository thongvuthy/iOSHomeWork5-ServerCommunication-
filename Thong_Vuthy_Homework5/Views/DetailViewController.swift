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
        imageHeadline.isUserInteractionEnabled = true
        imageHeadline.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longPressImage)))
        
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

    @objc func longPressImage(guesture : UILongPressGestureRecognizer) {
        print("long press")
        
        let alert:UIAlertController=UIAlertController(title: "Profile Picture Options", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let gallaryAction = UIAlertAction(title: "Save Gallary", style: UIAlertActionStyle.default)
        {
            UIAlertAction in self.saveGallary()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in self.cancel()
            
        }
        
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
        print("guesture hello")
        
    }
    
    func saveGallary()
    {
        UIImageWriteToSavedPhotosAlbum(imageHeadline.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    
    func cancel(){
        print("Cancel Clicked")
    }
    
   
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "This image has been saved to your Photo Library.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
