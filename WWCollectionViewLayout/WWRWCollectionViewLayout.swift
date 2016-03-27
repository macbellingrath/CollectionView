//
//  WWRWCollectionViewLayout.swift
//  WWCollectionViewLayout
//
//  Created by Mac Bellingrath on 3/26/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

protocol WWRWCollectionViewDelegateLayout {
    func sizeFor(album: Rectangle, atIndexPath indexPath: NSIndexPath)
}



public class WWRWCollectionViewLayout: UICollectionViewFlowLayout {
    
    var delegate: WWRWCollectionViewDelegateLayout?
    
    public override func collectionViewContentSize() -> CGSize {
        return CGSize(width: collectionView!.bounds.width, height: 1200)
    }
    
    public override func prepareLayout() {
        
    }

}
