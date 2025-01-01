//
//  HomeTableViewCell.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/27.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 22)
        titleLabel.text = "beidixiaoxiong"
        
        return titleLabel
    }()
    
    //旧版本的
//    private lazy var serviceButton: UIButton = {
//        let serviceButton = UIButton()
//        serviceButton.setTitle("button", for: .normal)
//        serviceButton.titleLabel?.font = .systemFont(ofSize: 15)
//        serviceButton.setTitleColor(UIColor(named: "buttonTextColor"), for: .normal)
//        serviceButton.backgroundColor = UIColor(named: "buttonBgColor")
//        serviceButton.layer.cornerRadius = 5
//        serviceButton.clipsToBounds = true
//
//        return serviceButton
//    }()
    
    private lazy var serviceButtonStackView: UIStackView = {
//        let serviceButtonStackView = UIStackView(arrangedSubviews: [serviceButton, serviceButton])
        let serviceButtonStackView = UIStackView()
        serviceButtonStackView.axis = .horizontal
        serviceButtonStackView.distribution = .fillProportionally
        serviceButtonStackView.spacing = 5
        
        return serviceButtonStackView
    }()
    
    //价格标签
    private lazy var lessonCountLabel: UILabel = {
        let lessonCountLabel = UILabel()
        lessonCountLabel.textColor = .secondaryLabel
        lessonCountLabel.font = .systemFont(ofSize: 15, weight: .medium)
        lessonCountLabel.text = "199元"
        
        return lessonCountLabel
    }()

    
    //最外层的StackViewUI
    private lazy var courseStackView: UIStackView = {
        let courseStackView = UIStackView(arrangedSubviews: [titleLabel, serviceButtonStackView, lessonCountLabel])
        courseStackView.axis = .vertical
        courseStackView.alignment = .leading
        courseStackView.spacing = 6
        courseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return courseStackView
    }()
    
    //代码实现的方法
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(courseStackView)
        setUIStackViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var course: Course? {
        didSet {
            guard let course = course else { return }
            
            for service_ in course.service {
                //新的button的使用
                let button = UIButton()
                var configura = UIButton.Configuration.tinted()
                
                var attrTitle = AttributedString(service_)
                attrTitle.font = .systemFont(ofSize: 15)
                attrTitle.foregroundColor = UIColor(named: "buttonTextColor")
                configura.attributedTitle = attrTitle
                
                configura.background.backgroundColor = UIColor(named: "buttonBgColor")
                configura.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 5, bottom: 4, trailing: 4)
        
                button.configuration = configura
                
                serviceButtonStackView.addArrangedSubview(button)
            }
        }
    }
    
}

extension HomeTableViewCell {
    func setUIStackViewUI() {
        courseStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        courseStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        courseStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        courseStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
