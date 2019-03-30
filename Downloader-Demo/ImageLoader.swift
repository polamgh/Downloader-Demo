//
//  ImageLoader.swift
//  Downloader-Demo
//
//  Created by Ali Ghanavati on 1/9/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Foundation

struct ImageLoader {
    static let sampleImageURLs: [URL] = {
        let prefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/"
        return (1...10).map { URL(string: "\(prefix)kingfisher-\($0).jpg")! }
    }()
    
    static let highResolutionImageURLs: [URL] = {
        let prefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/HighResolution/"
        return (1...20).map { URL(string: "\(prefix)\($0).jpg")! }
    }()
    
    static let gifImageURLs: [URL] = {
        let prefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/GIF/"
        return (1...3).map { URL(string: "\(prefix)\($0).gif")! }
    }()
}
