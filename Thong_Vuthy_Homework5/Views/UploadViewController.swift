//
//  UploadViewController.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 27/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

class UploadViewController: UIViewController {

    @IBOutlet weak var imageViewToUpload: UIImageView!
    @IBOutlet weak var titleInput: UITextField!
    
    @IBOutlet weak var articleInput: UITextView!

    var imagePickerController : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//
//        imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.allowsEditing = true
//
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            present(imagePickerController, animated: true, completion: nil)
//
//        }

        
        imageViewToUpload.isUserInteractionEnabled = true
        imageViewToUpload.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGuesture)))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addArticleClicked(_ sender: Any) {
        
    }
    
    @objc func tapGuesture(gesture: UITapGestureRecognizer) { 
     
    }
  
   

}
