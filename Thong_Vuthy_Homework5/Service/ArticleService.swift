//
//  ArticleService.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 26/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import Foundation
import Alamofire

class ArticleService {
    
    var article_get_url = "http://api-ams.me/v1/api/articles"
    var articel_post_url = "http://api-ams.me/v1/api/articles"
    var article_delete_url = "http://api-ams.me/v1/api/articles"
    var upload_image_url = "http://api-ams.me/v1/api/uploadfile/single"
    var article_put_url = "http://api-ams.me/v1/api/articles/"
    var delegate:ArticleServiceProtocol?
    
    let headers = [
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ="
    ]
    
    
    func getArticles(page: Int, limit: Int){
        var articles = [Article]()
        
        Alamofire.request(
            "\(article_get_url)?page=\(page)&limit=\(limit)", method: .get, encoding: URLEncoding.default, headers: headers
        ).responseJSON(completionHandler: {(respone) in
            if let json = try? JSONSerialization.jsonObject(with: respone.data!, options: .allowFragments) as! [String:Any] {
                 let objects = json["DATA"] as! NSArray
                for obj in objects {
                    articles.append(Article(JSON: obj as! [String:Any])!)
                }
                self.delegate?.responseArticle(article: articles)
                self.delegate?.responseMsg(msg: json["MESSAGE"] as! String)
            }
        })
    
    
    
    }
    
}
