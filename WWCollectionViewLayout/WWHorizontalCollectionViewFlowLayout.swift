//
//  WWHorizontalCollectionViewFlowLayout.swift
//  WWCollectionViewLayout
//
//  Created by Mac Bellingrath on 3/27/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit
protocol WWHorizontalCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
    
//    func collectionView(collectionView: UICollectionView,
//        heightForAnnotationAtIndexPath: NSIndexPath, withWidth: CGFloat) -> CGFloat
    
}

public class WWHorizontalCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var delegate: WWHorizontalCollectionViewDelegateFlowLayout?
    
    
    var numberOfColumns = 1
    var cellPadding: CGFloat = 1.0
    

    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat  = 0.0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return CGRectGetWidth(collectionView!.bounds) - (insets.left + insets.right)
    }
    
    override init() {
       super.init()
        self.collectionView?.contentInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        scrollDirection = .Horizontal
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func prepareLayout() {
        guard let delegate = delegate else { fatalError("WWHorizontalFlowLayout Delegate property has not been set") }
    
        guard cache.isEmpty  else { return }
        
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](count: numberOfColumns, repeatedValue: 0)
            
            
            for item in 0.stride(to:collectionView!.numberOfItemsInSection(0), by: 1) {
                
                let indexPath = NSIndexPath(forItem: item, inSection: 0)
                
                
                let width = columnWidth - cellPadding * 2
                let itemHeight = delegate.collectionView(collectionView!, heightForItemAtIndexPath: indexPath, withWidth: width)
                
                let height = cellPadding +  itemHeight  + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
                
                
                let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                yOffset[column] = yOffset[column] + height
                
                column = column >= (numberOfColumns - 1) ? 0 : column + 1
        }
    
    }
    
    public override func collectionViewContentSize() -> CGSize {
        
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override public func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache.filter{ attributes in CGRectIntersectsRect(attributes.frame , rect)
        }
    }
}
