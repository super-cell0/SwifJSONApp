//
//  HomeViewController.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/27.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource{
    
    var courses: [Course] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homecell")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "首页"
        
        loadData()
        //print(courses[0].title)
        self.view.addSubview(tableView)
        setTabelViewUI()
    }
    

}

extension HomeViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homecell", for: indexPath) as! HomeTableViewCell
        
//        var contentConfig = cell.defaultContentConfiguration()
//        contentConfig.text = courses[indexPath.row].title
//        
//        cell.contentConfiguration = contentConfig
        cell.course = courses[indexPath.row]
        
        return cell
    }
    
}

extension HomeViewController {
    func loadData() {
        if let coursesJSONURL = Bundle.main.url(forResource: "courses", withExtension: "json") {
            if let coursesJSONData = try? Data(contentsOf: coursesJSONURL) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    courses = try decoder.decode([Course].self, from: coursesJSONData)
                } catch  {
                    print(error)
                }
                
            } else {
                print("url转化Data失败")
            }
            
        } else {
            print("从courses.json文件中获取url失败 检查拼写")
        }
    }
    
}

extension HomeViewController {
    func setTabelViewUI() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
}
