//
//  DetailViewController.swift
//  Milestone8
//
//  Created by Davuthan Kurt on 16.07.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var imageView: UIImageView!
    var image: UIImage!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
}
