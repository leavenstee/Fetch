//
//  ViewController.swift
//  Fetch-Example
//
//  Created by Steven Lee on 7/8/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    struct Photo: Codable
    {
        //String, URL, Bool and Date conform to Codable.
        var author: String
        var author_url: URL
        var filename: String
        var format
        //The Dictionary is of type [String:String] and String already conforms to Codable.
        var metaData: [String:String]
        
        //PhotoType and Size are also Codable types
        var type: PhotoType
        var size: Size
    }
    
    var collectionView : UICollectionView!
    var data : [ImageObject]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
  
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero)
        collectionView.collectionViewLayout = .init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.collectionView)
    }
    
    
    func loadData() {
        let fetcher = Fetch.sharedFetcher
        fetcher.get(urlString: "https://picsum.photos/list", params: nil) { (json) in
            
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}


