//
//  ImageCollectionViewCell.swift
//  Fetch-Example
//
//  Created by Steven Lee on 10/24/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var viewModel: ImageObject!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var authorUrlLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }
    
    public func drawCellWithViewModel(_ viewModel: ImageObject) {
        self.viewModel = viewModel
        self.imageView.image = self.fetchImageFromID(viewModel.id)
        self.authorLabel.text = viewModel.author
        self.authorUrlLabel.text = viewModel.author_url.absoluteString
    }
    
    private func fetchImageFromID(_ id : Int) -> UIImage? {
        // Image URL https://picsum.photos/300/200?image=[ID]
        
        let urlString = "https://picsum.photos/300/300?image=\(id)"
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            return image
        }
        return nil
    }

}
