//
//  CollectionViewTableViewCell.swift
//  Thong_Vuthy_Homework5
//
//  Created by Adimax Lee on 25/12/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    override func layoutSubviews() {
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.alwaysBounceHorizontal = true
        let layout = CustomLayout()
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.isDirectionalLockEnabled = true
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "headlinecollectionviewcell", for: indexPath) as!  HeadLineCollectionViewCell
        return cell
    }
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}



class CustomLayout: UICollectionViewFlowLayout {
    var innerSpace: CGFloat = 0
    let numberOfCellsOnRow: CGFloat = 1
    
    override init() {
        super.init()
        self.minimumLineSpacing = innerSpace
        self.minimumInteritemSpacing =  innerSpace
        self.scrollDirection = .horizontal
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
      
    }
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    func itemWidth() -> CGFloat {
        return (collectionView!.frame.size.width/self.numberOfCellsOnRow )
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width:itemWidth(), height:200)
        }
        get {
            return CGSize(width:itemWidth(),height:200)
        }
    }
    
}





//extension CollectionViewTableViewCell : UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let itemWidth = Constant.getItemWidth(boundWidth: collectionView.bounds.size.width)
//
//        return CGSize(width: itemWidth, height: itemWidth)
//    }
//
//}
//
//
//
//class Constant {
//    static let totalItem: CGFloat = 20
//
//    static let column: CGFloat = 1
//
//    static let minLineSpacing: CGFloat = 1.0
//    static let minItemSpacing: CGFloat = 1.0
//
//    static let offset: CGFloat = 1.0 // TODO: for each side, define its offset
//
//    static func getItemWidth(boundWidth: CGFloat) -> CGFloat {
//
//        // totalCellWidth = (collectionview width or tableview width) - (left offset + right offset) - (total space x space width)
//        let totalWidth = boundWidth - (offset + offset) - ((column - 1) * minItemSpacing)
//
//        return totalWidth / column
//    }
//}

