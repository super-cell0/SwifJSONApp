//
//  HomeViewController.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/27.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource{
    
    //接受json解析的值
    var courses: [Course] = []
    //自定一个tableView列表
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homecell")
        
        return tableView
    }()

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadData()
        //print(courses[0].title)
        self.view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabelViewUI()
    }
    

}

extension HomeViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homecell", for: indexPath) as! HomeTableViewCell
        
        //默认列表内容配置
        cell.course = courses[indexPath.row]
        
        return cell
    }
    
}

extension HomeViewController {
    ///解析JSON数据标准格式
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
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
}
