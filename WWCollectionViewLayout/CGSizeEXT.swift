//
//  CGSizeExt.swift
//  WWCollectionViewLayout
//
//  Created by Mac Bellingrath on 3/27/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation

public func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}