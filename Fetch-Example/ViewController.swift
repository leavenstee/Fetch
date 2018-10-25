//
//  ViewController.swift
//  Fetch-Example
//
//  Created by Steven Lee on 7/8/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var data : [ImageObject]!
    var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = []
        
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 400)
        }
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
                
                let tempImageObject = ImageObject(author: photoData["author"] as! String,
                                                  author_url: URL(string: photoData["author_url"] as! String)!,
                                                  filename: photoData["filename"] as! String,
                                                  format: photoData["format"] as! String,
                                                  height: photoData["height"] as! Int,
                                                  id: photoData["id"] as! Int,
                                                  post_url: URL(string: photoData["post_url"] as! String)!,
                                                  width:photoData["width"] as! Int)
            
                self.data.append(tempImageObject)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        
        cell.drawCellWithViewModel(data[indexPath.row])
       
        return cell
    }
    
  
}



