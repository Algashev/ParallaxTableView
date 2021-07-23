//
//  TableViewController.swift
//  ParallaxTableView
//
//  Created by Александр Алгашев on 08.08.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.configureTableHeaderView()
        self.tableView.tableHeaderView?.bounds.size.height = 200
    }
    
    private func  configureTableHeaderView() {
        let tableHeaderView = ParallaxTableHeaderView()
        tableHeaderView.imageView.image = #imageLiteral(resourceName: "beauty")
        tableHeaderView.insertInTableView(self.tableView, controller: self)
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
