@testable import WWCollectionViewLayout
import XCPlayground
import UIKit


let album = Album(title:"1")
let headercell = WWHeaderCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
headercell.configure(album)
XCPlaygroundPage.currentPage.liveView = headercell

