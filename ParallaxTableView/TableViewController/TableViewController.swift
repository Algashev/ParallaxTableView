//
//  TableViewController.swift
//  ParallaxTableView
//
//  Created by Александр Алгашев on 08.08.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private var tableHeaderView = TableHeaderView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableHeaderView = self.tableHeaderView
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.tableHeaderView?.bounds.size.height = 200
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "This is a row \(indexPath.row)"

        return cell
    }

}

//MARK: - UIScrollViewDelegate

extension TableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let tableHeaderView = self.tableView.tableHeaderView else { return }
        
        var topContentInset: CGFloat = 0
        if #available(iOS 11.0, *) {
            topContentInset = scrollView.adjustedContentInset.top
        } else {
            topContentInset = self.topLayoutGuide.length
        }
        let offsetY = -(scrollView.contentOffset.y + topContentInset)
        self.tableHeaderView.imageViewHeightConstraint.constant = max(tableHeaderView.bounds.height, tableHeaderView.bounds.height + offsetY)
        self.tableHeaderView.imageViewBottomConstraint.constant = offsetY >= 0 ? 0 : offsetY / 2
        
        tableHeaderView.clipsToBounds = offsetY <= 0
    }
}
