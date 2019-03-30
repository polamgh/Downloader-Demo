//
//  Dowloader.swift
//  Downloader-Demo
//
//  Created by Ali Ghanavati on 1/9/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import UIKit


class Downloader : NSObject {
    fileprivate var link : String?
    fileprivate var downloadTask : URLSessionDataTask?
    fileprivate var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    
    
    public init(link: String){
        self.link = link
    }
    func downloadFileAsync( completion: @escaping (Data?, Error?) -> Void)
    {
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral, delegate: nil , delegateQueue: nil)
        guard let link = self.link else{
            return
        }
        guard let fileURL = URL(string: link ) else {
            return
        }
        var request = URLRequest(url: fileURL)
        request.httpMethod = "GET"
        downloadTask = session.dataTask(with: request, completionHandler:
        {
            data, response, error in
            completion(data, error)
        })
        downloadTask!.resume()
        registerBackgroundTask()
    }
    
    
    private func registerBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.endBackgroundTask()
        }
        assert(backgroundTask != .invalid)
    }
    
    public func endBackgroundTask() {
        
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = .invalid
        self.downloadTask?.cancel()
    }
    
    public func pauseDownload() {
        downloadTask?.suspend()
    }
    
    public func resumeDownload() {
        downloadTask?.resume()
    }
    
}

