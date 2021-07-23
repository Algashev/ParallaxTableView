//
//  ParallaxTableHeaderView.swift
//  ParallaxTableView
//
//  Created by Александр Алгашев on 23.07.2021.
//  Copyright © 2021 Александр Алгашев. All rights reserved.
//

import UIKit

class ParallaxTableHeaderView: UIView {
    private var imageViewHeightConstraint: NSLayoutConstraint!
    private var imageViewBottomConstraint: NSLayoutConstraint!
    
    var imageView: UIImageView!
    
    private var observation: NSKeyValueObservation?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialSetup()
    }
    
    private func initialSetup() {
        self.imageView = self.setupImageView()
        self.addSubview(self.imageView)
        (self.imageViewHeightConstraint, self.imageViewBottomConstraint) = self.addConstraints(to: self.imageView)
    }
    
    private func setupImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    private func addConstraints(to imageView: UIImageView) -> (heightConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: self.bounds.height)
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        
        NSLayoutConstraint.activate([
            heightConstraint,
            bottomConstraint,
            self.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            self.rightAnchor.constraint(equalTo: imageView.rightAnchor)
        ])
        
        return (heightConstraint, bottomConstraint)
    }
    
    func insertInTableView(_ tableView: UITableView, controller: UIViewController) {
        tableView.tableHeaderView = self
        self.observation = tableView.observe(\.contentOffset, options: [.old, .new], changeHandler: { [weak self, weak controller] tableView, _ in
            self?.layoutImageView(in: tableView, controller: controller)
        })
    }
    
    private func layoutImageView(in tableView: UITableView, controller: UIViewController?) {
        var topContentInset: CGFloat = 0
        if #available(iOS 11.0, *) {
            topContentInset = tableView.adjustedContentInset.top
        } else {
            topContentInset = controller?.topLayoutGuide.length ?? 0
        }
        let offsetY = -(tableView.contentOffset.y + topContentInset)
        self.imageViewHeightConstraint.constant = max(self.bounds.height, self.bounds.height + offsetY)
        self.imageViewBottomConstraint.constant = offsetY >= 0 ? 0 : offsetY / 2
        
        self.clipsToBounds = offsetY <= 0
    }
    

}
