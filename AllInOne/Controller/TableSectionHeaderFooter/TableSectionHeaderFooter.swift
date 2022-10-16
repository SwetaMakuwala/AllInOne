//
//  TableSectionHeaderFooter.swift
//  AllInOne
//
//  Created by sweta makuwala on 14/07/22.
//

import UIKit

class TableSectionHeaderFooter: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = [
        ["one", "two", "three"],
        ["mango", "banana"],
        ["fiber", "protein", "vitamins"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    
    func setUp() {
    
        tableView.dataSource = self
        tableView.delegate = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        
        header.backgroundColor = .green
        footer.backgroundColor = .magenta
        let label =  UILabel(frame: header.bounds)
        label.text = "iOS Development"
        label.textAlignment = .center
        header.addSubview(label)
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
    
}


extension TableSectionHeaderFooter : UITableViewDataSource {
    private func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 61.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.TableSectionHeaderFooterCell, for: indexPath) as! TableSectionHeaderFooterCell
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row]
        cell.backgroundColor = .red
        return cell
    }
}

extension TableSectionHeaderFooter : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
