//
//  WWHeaderCollectionViewCell.swift
//  WWCollectionViewLayout
//
//  Created by Mac Bellingrath on 3/27/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

@IBDesignable
public class WWHeaderCollectionViewCell: UICollectionViewCell {
    
    private var outterStackView: UIStackView!
    private var innerStackView: UIStackView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .whiteColor()
        outterStackView = UIStackView(frame: frame)
        outterStackView.alignment = .Fill
        outterStackView.distribution = .FillProportionally
        outterStackView.axis = .Horizontal
        outterStackView.spacing = 1
        self.addSubview(outterStackView)
        
        innerStackView = UIStackView()
        innerStackView.alignment = .Fill
        innerStackView.distribution = .FillEqually
        innerStackView.axis = .Vertical
        innerStackView.spacing = 1
        outterStackView.addArrangedSubview(innerStackView)
        
    }

    public func configure(album: AlbumRepresentable) {
    
        for (index, image) in album.images.enumerate() {
            switch index {
            case 0:
                outterStackView.insertArrangedSubview(image, atIndex: 0)
            default:
                innerStackView.addArrangedSubview(image)
            }
        }
        let labelHeight: CGFloat = 35
        let label = UILabel(frame: CGRect(x: frame.minX, y: frame.maxY - labelHeight , width: frame.width, height: labelHeight))
        label.textAlignment = .Right
        label.text = album.title
        label.textColor = .blackColor()
        label.font = UIFont.boldSystemFontOfSize(labelHeight / 2 )
        label.backgroundColor = .whiteColor()
        label.alpha = 0.5

        
        addSubview(label)
        bringSubviewToFront(label)
        label.updateConstraintsIfNeeded()
        setNeedsDisplay()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
