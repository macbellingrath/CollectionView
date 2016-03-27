//
//  WWHorizontalCollectionViewController.swift
//  WWCollectionViewLayout
//
//  Created by Mac Bellingrath on 3/27/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "RealWeddingHeaderViewCell"

class WWHorizontalCollectionViewController: UICollectionViewController {
    
    
    var albums = [AlbumRepresentable]()
    
    init() {
        let layout = WWHorizontalCollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        layout.delegate = self
        
        for i in 0.stride(to: 8, by: 1) {
            albums.append(Album(title: "\(i)"))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.registerClass(WWHeaderCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int { return 1 }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        // Configure the cell
    
        return cell
    }

}

extension WWHorizontalCollectionViewController: WWHorizontalCollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat{
        let album = albums[indexPath.item]
        return album.height(withWidth: width)
        
    }
}
