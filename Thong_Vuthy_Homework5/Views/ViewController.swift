//
//  ViewController.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 22/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, ArticlePresenterProtocol,  UITableViewDataSource, UITableViewDelegate  {
 

    var articlePresentor : ArticlePresenter?
    
    var articles : [Article]?
    @IBOutlet weak var tableView: UITableView!
    var anotherRedRetangar : UILabel!
    
    var homeView : UIView!
    var categoryView : UIView!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var homeTabBar: UITabBarItem!
    
    @IBOutlet weak var categoryTabBar: UITabBarItem!
    
    @IBOutlet weak var sourceTabBar: UITabBarItem!
    var currentArticle : Article?
    
    
    var currunTab : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                self.navigationItem.title = "Home"
           self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.white

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.organize, target: self, action: nil)
         self.navigationItem.leftBarButtonItem?.tintColor = .white
        
        let appearanceBar = UINavigationBar.appearance()
        let attributeBar   = [NSAttributedStringKey.foregroundColor : UIColor(named: "White")]
        appearanceBar.titleTextAttributes = attributeBar
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        tabBar.delegate = self
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedStringKey.font:UIFont(name: "System Font", size: 17)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
      

     
        currunTab = "Home"
        
        let nib = UINib(nibName: "HomeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "homecell")
        let nib2 = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "categorycell")
        
        articles = [Article]()
        self.articlePresentor = ArticlePresenter()
        self.articlePresentor?.delegate = self
        self.articlePresentor?.getArticles(page: 1, limit: 15)
       
        tableView.delegate = self
        tableView.dataSource = self

    
    }
    
    
    func didResponseArticle(article: [Article]) {
        self.articles = article
        self.tableView.reloadData()
        print(article.count)
    }
    
    func didResponseMsg(msg: String) {
        print("Hello API \(msg) ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
     cofigureTabBar()
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentArticle = articles![indexPath.row - 1 ]
        performSegue(withIdentifier: "articledetailseque", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(articles!.count)
        return (articles?.count)! + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(currunTab == "Home") {
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "collectionviewtableviewecell") as! CollectionViewTableViewCell 
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "homecell") as! HomeCell
                print(articles![indexPath.row - 1])
                cell.configureCell(article: articles![indexPath.row - 1])
                return cell
            }
            
        } else if(currunTab == "Category") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell") as! CategoryTableViewCell
            return cell
        }
        
        return UITableViewCell()
       
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DetailViewController
        controller.article = currentArticle
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("hello")
        if(item.title! == "Home") {
            UIView.transition(with: self.tableView, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.currunTab = "Home"
                self.tableView.reloadData()
            }, completion: nil)

            
            UIView.animate(withDuration: 0.5){
                self.anotherRedRetangar.frame.origin.x =  self.tabBar.frame.origin.x
            }
        }else if(item.title! == "Category") {

            UIView.transition(with: self.tableView, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                
                self.currunTab = "Category"
                self.tableView.reloadData()
                
            }, completion: nil)
            

            UIView.animate(withDuration: 0.5){
                self.anotherRedRetangar.frame.origin.x = self.tabBar.frame.origin.x + self.tabBar.frame.width/3
            }
        }else {
            
            UIView.transition(with: self.tableView, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                
                self.currunTab = "Category"
                self.tableView.reloadData()
                
            }, completion: nil)
            UIView.animate(withDuration: 0.5){
                self.anotherRedRetangar.frame.origin.x = self.tabBar.frame.origin.x + self.tabBar.frame.width/1.5
            }

        }
    }
    
    
    
    func cofigureTabBar() {
        let   alabelX = tabBar.frame.origin.x
        let   alabelY  = tabBar.frame.origin.y + tabBar.frame.height - tabBar.frame.height/10
        let   alabelW  : CGFloat = tabBar.frame.width/3
        let   alabelH : CGFloat = tabBar.frame.height/11
        
        anotherRedRetangar = UILabel(frame: CGRect(x: alabelX, y: alabelY, width: alabelW, height: alabelH))
        anotherRedRetangar.backgroundColor = .red
        anotherRedRetangar.text = ""
        self.view.addSubview(anotherRedRetangar)
        
        homeTabBar.image = nil
        categoryTabBar.image = nil
        sourceTabBar.image = nil
        
        homeTabBar.titlePositionAdjustment.vertical = -14
        categoryTabBar.titlePositionAdjustment.vertical = -14
        sourceTabBar.titlePositionAdjustment.vertical = -14
    }
}

