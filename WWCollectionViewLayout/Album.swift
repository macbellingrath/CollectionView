//
//  Album.swift
//  WWCollectionViewLayout
//
//  Created by Mac Bellingrath on 3/26/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation
import AVFoundation

public protocol AlbumRepresentable {
    var images: [UIView] { get } // change
    var title: String { get }
}


public extension AlbumRepresentable {
    public func height(withWidth width: CGFloat) -> CGFloat {
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        guard let firstSize = images.first?.bounds.size else { fatalError("failed to return size for photo. No images.") }
        let totalSize = images.reduce(firstSize) { $0.0 + $0.1.bounds.size }
        return AVMakeRectWithAspectRatioInsideRect(totalSize, boundingRect).size.height

    }
}



public struct Album: AlbumRepresentable {
    public var images: [UIView] = []
    public var title: String = "Virginia Wedding"

    init(title: String) {
        self.title += title
        for _ in 0.stride(to: 3, by: 1) {
            let view = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 320, height: 160)))
            view.backgroundColor = .cyanColor()
            images.append(view)
            
        }
    }
}



public struct Rectangle {
    var size: CGSize
    var color: UIColor
}
public struct RectangleGenerator: GeneratorType {
    var length: CGFloat

    init(length : CGFloat = 250) {
        self.length = length
    }

     public func next() -> Rectangle? {
        
        let num = Double(arc4random_uniform(200))
        let even = num % 2 == 0
        let width = even ? self.length : self.length / 2
        let height = even ? self.length / 2 : self.length
        
        let color = UIColor(red: 0.1, green:  0.11, blue: 0.2, alpha: 1)
        return Rectangle(size: CGSize(width: width, height: height), color: color)
        
    }
}