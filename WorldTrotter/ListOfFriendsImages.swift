//
//  ListOfFriendsImages.swift
//  WorldTrotter
//
//  Created by Laurence Wingo on 11/29/17.
//  Copyright © 2017 Laurence Wingo. All rights reserved.
//

import Foundation
import UIKit

class ListOfFriendsImages: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createView()
    }
    func createView(){
        let radius = max(frame.width, frame.height) / 2
        layer.cornerRadius = radius
        clipsToBounds = true
        backgroundColor = .lightGray
    }
}
