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
    
    private let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    var currunTab : String!
    var page = 1
    
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
            
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.action = #selector(addButtonItemClicked)
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
        self.articlePresentor?.getArticles(page: page, limit: 10)
       
        
       
        spinner.color = UIColor.darkGray
        spinner.hidesWhenStopped = true
        tableView.tableFooterView = spinner
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self

    
    }
    
    
    func didResponseArticle(article: [Article]) {
        self.articles! += article
        self.tableView.reloadData()
        self.spinner.stopAnimating()
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
        return (articles?.count)! + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(currunTab == "Home") {
            if indexPath.row == 0 {
                print("collection view")
                if  articles!.count > 1  {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "collectionviewtableviewecell", for: indexPath) as! CollectionViewTableViewCell
                    return cell
                }
            }
                
            else {
                    print("homecell view")
                    let cell = tableView.dequeueReusableCell(withIdentifier: "homecell", for: indexPath) as! HomeCell
                    cell.configureCell(article: articles![indexPath.row - 1])
                    return cell
  
            }
            
        } else if(currunTab == "Category") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell") as! CategoryTableViewCell
            return cell
        }
        
        return UITableViewCell()
       
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
        {
        print("scrolling reaches last!")
            
            page = page + 1
            articlePresentor?.getArticles(page: page, limit: 10)
            
            spinner.startAnimating()
           
            
           
        }
    }
    
    
    
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data
        refreshArticle()
    }
    
    private func  refreshArticle() {
        page = 1
        articlePresentor?.getArticles(page: page, limit: 10)
        self.refreshControl.endRefreshing()
               // self.activityIndicatorView.stopAnimating()
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
        } else {
            
            UIView.transition(with: self.tableView, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                
                self.currunTab = "Category"
                self.tableView.reloadData()
                
            }, completion: nil)
            UIView.animate(withDuration: 0.5){
                self.anotherRedRetangar.frame.origin.x = self.tabBar.frame.origin.x + self.tabBar.frame.width/1.5
            }

        }
    }
    
    
    @objc func addButtonItemClicked() {
        print("Add button tapped")
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

