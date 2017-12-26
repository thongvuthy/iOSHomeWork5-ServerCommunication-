//
//  ArticlePresenter.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 26/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import Foundation
class ArticlePresenter: ArticleServiceProtocol {
    
    var delegate : ArticlePresenterProtocol?    
    var articleService : ArticleService?
    
    init() {
        self.articleService = ArticleService()
        self.articleService?.delegate = self
    }
    
    func getArticles(page: Int, limit: Int) {
        articleService?.getArticles(page: page, limit: limit)
    }
    
    func responseArticle(article: [Article]) {
        self.delegate?.didResponseArticle(article: article)
    }
    
    func responseMsg(msg: String) {
        self.delegate?.didResponseMsg(msg: msg)
    }

}
