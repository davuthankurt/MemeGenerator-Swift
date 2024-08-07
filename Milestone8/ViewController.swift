//
//  ViewController.swift
//  Milestone8
//
//  Created by Davuthan Kurt on 16.07.2024.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, 
                      UINavigationControllerDelegate {

    var memes = [UIImage]()
    
    var label = "example"
    
    init() {
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "MEMES"
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(memeGenerator))

        collectionView.backgroundColor = .purple
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
       
        cell.backgroundColor = .white
        cell.imageView.image = memes[indexPath.row]
        cell.memeLabel.text = label
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.image = memes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
    
    
    
    
    
    
    
    @objc func memeGenerator(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        
        var attributedString1: NSAttributedString!
        var attributedString2: NSAttributedString!
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 54),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.white
        ]
        
        
        
        let ac = UIAlertController(title: "Above Meme Text", message: "Please enter", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Ok", style: .default) {[weak self, weak ac] _ in
            guard let self else { return }
            
            guard let atStrText1 = ac?.textFields?[0].text else { return }
            
            
            let ac2 = UIAlertController(title: "Down Meme Text", message: "Please enter", preferredStyle: .alert)
            ac2.addTextField()
            ac2.addAction(UIAlertAction(title: "Pass", style: .cancel))
            ac2.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac2] _ in
                guard let self else { return }
                guard let atStrText2 = ac2?.textFields?[0].text else { return }
                
                
                attributedString2 = NSAttributedString(string: atStrText2, attributes: attrs)
                
                let renderer = UIGraphicsImageRenderer(size: CGSize(width: image.size.width, height: image.size.height))
                let memeImage = renderer.image { ctx in
                    image.draw(at: .zero)
                    
                    
                    attributedString1 = NSAttributedString(string: atStrText1, attributes: attrs)
                    attributedString1.draw(with: CGRect(x: 0, y: 60, width: image.size.width, height: 60), options: .usesLineFragmentOrigin, context: nil)
                    attributedString2.draw(with: CGRect(x: 0, y: image.size.height-120, width: image.size.width, height: 60), options: .usesLineFragmentOrigin, context: nil)
                }
                memes.append(memeImage)
                collectionView.reloadData()
            })

            present(ac2, animated: true)
        })
        present(ac, animated: true)
    }
}

