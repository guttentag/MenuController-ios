//
//  GUMenuController.swift
//  MenuController
//
//  Created by Eran Guttentag on 03/07/2018.
//  Copyright © 2018 Gutte. All rights reserved.
//

import UIKit

protocol GUMenuControllerDelegate: class {
    func selected(_ item: MenuItem)
}

class GUMenuController: UIView {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var itemsTableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    private var widthConstraint: NSLayoutConstraint!
    private var dataSource = [MenuItem]()
    
    var delegate: GUMenuControllerDelegate?
    
    var width: CGFloat {
        get {
            return self.widthConstraint.constant
        }
        
        set {
            self.widthConstraint.constant = newValue
        }
    }
    
    var title: NSAttributedString? {
        get {
            return self.titleLabel.attributedText
        }
        
        set {
            self.titleLabel.attributedText = newValue
        }
    }
    
    var subTitle: NSAttributedString? {
        get {
            return self.subTitleLabel.attributedText
        }
        
        set {
            self.subTitleLabel.attributedText = newValue
        }
    }
    
    var data: [MenuItem] {
        get {
            return self.dataSource
        }
        
        set {
            self.dataSource = newValue
            if Thread.isMainThread {
                self.itemsTableView.reloadData()
            } else {
                DispatchQueue.main.async {
                    self.itemsTableView.reloadData()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.itemsTableView.backgroundColor = UIColor.clear
        
        self.itemsTableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: MenuItemTableViewCell.identifier)
        self.itemsTableView.allowsMultipleSelection = false
        self.itemsTableView.allowsSelection = true
        self.itemsTableView.dataSource = self
        self.itemsTableView.separatorStyle = .none
        self.itemsTableView.showsVerticalScrollIndicator = false
        
        self.titleLabel.textColor = UIColor.white
        self.subTitleLabel.textColor = UIColor.white
    }
}

private extension GUMenuController {
    func commonInit() {
        Bundle.main.loadNibNamed("GUMenuController", owner: self, options: nil)
        self.addSubview(self.contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        self.widthConstraint = self.widthAnchor.constraint(equalToConstant: 300)
        self.widthConstraint.isActive = true
    }
}

extension GUMenuController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemTableViewCell.identifier, for: indexPath) as! MenuItemTableViewCell
        
        let item = self.dataSource[indexPath.row]
        cell.set(item)
        
        return cell
    }
    
    
}
