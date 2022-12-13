//
//  GameDetailCollectionViewCell.swift
//  GameBook
//
//  Created by Hasan Uysal on 13.12.2022.
//

import UIKit
import SDWebImage

class GameDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(imageUrl: String) {
        imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "gta"))
    }
}
