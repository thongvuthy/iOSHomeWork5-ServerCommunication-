//
//  ArticlePresenterProtocol.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 26/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import Foundation

protocol ArticlePresenterProtocol {
    func didResponseArticle(article: [Article])
    func didResponseMsg(msg: String)
}

