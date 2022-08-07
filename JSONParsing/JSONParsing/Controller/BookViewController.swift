//
//  BookViewController.swift
//  JSONParsing
//
//  Created by xiaoxiong beidi on 2022/8/6.
//

import UIKit
import BLTNBoard

class BookViewController: UIViewController {
    
    private lazy var sheetButton3: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.title = "点击 3"
        button.tintColor = UIColor(named: "buttonTextColor")
        config.background.backgroundColor = UIColor(named: "buttonBgColor")
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var sheetView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .systemGray6
        uiView.layer.cornerRadius = 40
        uiView.layer.masksToBounds = true
        uiView.layer.borderColor = UIColor.systemGray5.cgColor
        uiView.layer.borderWidth = 1
        
        return uiView
    }()
    
    private lazy var sheetButton2: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.title = "点击 2"
        button.tintColor = UIColor(named: "buttonTextColor")
        config.background.backgroundColor = UIColor(named: "buttonBgColor")
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
//    private lazy var sheetButton1 = UIButton(configuration: .filled(), primaryAction: .init(handler: { _ in
//        let storyBoard = UIStoryboard(name: "Sheet", bundle: nil)
//        let sheetPresenttationVC = storyBoard.instantiateViewController(withIdentifier: "SheetViewControllerID") as! SheetViewController
//        self.present(sheetPresenttationVC, animated: true, completion: nil)
//    }))
    
    private lazy var boardManager: BLTNItemManager = {
        let item  = BLTNPageItem(title: "推送通知")
        //128x128px
        item.image = UIImage(systemName: "square.and.arrow.up")
        item.actionButtonTitle = "继续"
        item.alternativeButtonTitle = "下一步"
        item.descriptionText = "beidixiaoxiong is super-cell0"
        item.actionHandler = { _ in
            BookViewController.didTapBoardContinue()
        }
        item.alternativeHandler = { _ in
            BookViewController.didTapBoardSkip()
        }
        item.appearance.actionButtonColor = .systemGreen
        item.appearance.alternativeButtonTitleColor = .gray
        
        return BLTNItemManager(rootItem: item)
    }()
    
    private lazy var sheetButton1: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.title = "点击 1"
        button.tintColor = UIColor(named: "buttonTextColor")
        config.background.backgroundColor = UIColor(named: "buttonBgColor")
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(sheetButton1)
        sheetButtonAction()
        
        sheetButton2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sheetButton2)
        
        sheetView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sheetView)
        
        sheetButton3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sheetButton3)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setBookAnyUI()
    }

    private func setBookAnyUI() {
        sheetButton1.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 100 , y: 100, width: 200, height: 44)
        sheetButton2.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 120 + sheetButton1.bounds.height, width: 200, height: 44)
        
        sheetButton3.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 140 + sheetButton1.bounds.height * 2, width: 200, height: 44)

        sheetView.frame = CGRect(x: 20, y: 500, width: UIScreen.main.bounds.width - 40, height: 300)
//        sheetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
//        sheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        sheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        sheetView.heightAnchor.constraint(equalToConstant: 300).isActive = true

    }
    
}

extension BookViewController {
    
    private func sheetButtonAction() {
        sheetButton1.addTarget(self, action: #selector(sheetAction), for: .touchUpInside)
        sheetButton2.addTarget(self, action: #selector(sheet2Action), for: .touchUpInside)
    }
    
    @objc func sheetAction(_ sender: UIButton) {
        boardManager.showBulletin(above: self)
    }
    
    @objc func sheet2Action(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Sheet", bundle: nil)
        let sheetPresenttationVC = storyBoard.instantiateViewController(withIdentifier: "SheetViewControllerID") as! SheetViewController
        self.present(sheetPresenttationVC, animated: true, completion: nil)

    }

    
    static func didTapBoardContinue() {
        print("continue")
    }
    
    static func didTapBoardSkip() {
        print("skip")
    }
}
