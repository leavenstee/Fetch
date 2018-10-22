//
//  ViewController.swift
//  Fetch-Example
//
//  Created by Steven Lee on 7/8/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    struct ImageObject: Codable
    {
        //String, URL, Bool and Date conform to Codable.
        var author: String
        var author_url: URL
        var filename: String
        var format : String
        var height : Int
        var id : Int
        var post_url : URL
        var width: Int

    }
    
    var data : [ImageObject] = []
    
    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(self.collectionView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[collectionView]-0-|", options: [], metrics: nil, views: ["collectionView":collectionView]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionView]-0-|", options: [], metrics: nil, views: ["collectionView":collectionView]))
        
        loadData()
  
    }

    
    func loadData() {
        let fetcher = Fetch.sharedFetcher
        fetcher.get(urlString: "https://picsum.photos/list", params: nil) { (json) in
            let photoArrayData = json as! [Dictionary<String, Any>]
            for photoData in photoArrayData {
                self.data.append(ImageObject(author: photoData["author"] as! String,
                                        author_url: URL(string: photoData["author_url"] as! String)!,
                                       filename: photoData["filename"] as! String,
                                       format: photoData["format"] as! String,
                                       height: photoData["height"] as! Int,
                                       id: photoData["id"] as! Int,
                                       post_url: URL(string: photoData["post_url"] as! String)!,
                                       width:photoData["width"] as! Int))
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        cell.backgroundColor = .red
        
        print(data[indexPath.row].author)
        
        return cell
    }
}



