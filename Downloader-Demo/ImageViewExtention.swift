//
//  ImageViewExtention.swift
//  Downloader-Demo
//
//  Created by Ali Ghanavati on 1/10/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(link: String) {
        Downloader(link: link).downloadFileAsync { (data, error) in
            if error == nil{
                guard let imageData = data else{
                    return
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
                
            }
        }
    }
}
