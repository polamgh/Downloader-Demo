//
//  ViewController.swift
//  Downloader-Demo
//
//  Created by Ali Ghanavati on 1/9/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func btnRefresh(_ sender: Any) {
        collectionView.reloadData()
    }
    
}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageLoader.sampleImageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! MainCollectionViewCell
        
//        cell.imageView.kf.setImage(with: ImageLoader.sampleImageURLs[indexPath.row], options: [.cacheMemoryOnly ,.memoryCacheExpiration(.seconds(5))])
//        cell.imageView.downloaded(from: ImageLoader.sampleImageURLs[indexPath.row])
        cell.imageView.setImage(link: ImageLoader.sampleImageURLs[indexPath.row].absoluteString)
        return cell
    }
    
    
    
    
    
}




