//
//  TableHeaderView.swift
//  ParallaxTableView
//
//  Created by Александр Алгашев on 08.08.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import UIKit

@IBDesignable
class TableHeaderView: UIView {
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadFromNib()
    }
}
