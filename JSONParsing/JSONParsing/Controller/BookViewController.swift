//
//  BookViewController.swift
//  JSONParsing
//
//  Created by xiaoxiong beidi on 2022/8/6.
//

import UIKit

class BookViewController: UIViewController {
    
    private lazy var sheetButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.title = "点击我"
        button.tintColor = UIColor(named: "buttonTextColor")
        config.background.backgroundColor = UIColor(named: "buttonBgColor")
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(sheetButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setBookAnyUI()
    }

    private func setBookAnyUI() {
        sheetButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 100 , y: 100, width: 200, height: 44)
    }
}
