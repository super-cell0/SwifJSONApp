//
//  PersonalViewController.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/27.
//

import UIKit

class PersonalViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PersonalTableViewCell.self, forCellReuseIdentifier: "personalTableCell")
        tableView.backgroundColor = .systemPink
        return tableView
    }()
    
    var coursesPersonals: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Personal"
        loadDataFromJSON()
        view.addSubview(tableView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setAnyUI()
    }
    

}

extension PersonalViewController {
    private func setAnyUI() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view..bottomAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
    }
}

extension PersonalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesPersonals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalTableCell", for: indexPath) as! PersonalTableViewCell

        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = coursesPersonals[indexPath.row].title
        cell.contentConfiguration = contentConfig
        return cell
    }
    
}

extension PersonalViewController {
    private func loadDataFromJSON() {
        if let coursesJSONURL = Bundle.main.url(forResource: "courses", withExtension: "json") {
            if let coursesData = try? Data(contentsOf: coursesJSONURL) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    coursesPersonals = try decoder.decode([Course].self, from: coursesData)
                } catch  {
                    fatalError("解析数据失败")
                }
            } else {
                fatalError("转化数据失败")
            }
        } else {
            fatalError("取数据失败")
        }
    }
}
