//
//  CollectionViewCell.swift
//  Milestone8
//
//  Created by Davuthan Kurt on 16.07.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var memeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        
        memeLabel = UILabel()
        memeLabel.textAlignment = .center
        memeLabel.translatesAutoresizingMaskIntoConstraints = false
        memeLabel.text = ""
        contentView.addSubview(memeLabel)
        
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: memeLabel.layoutMarginsGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            memeLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
            memeLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            memeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
