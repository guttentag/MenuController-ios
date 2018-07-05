//
//  MenuItem.swift
//  MenuController
//
//  Created by Eran Guttentag on 03/07/2018.
//  Copyright © 2018 Gutte. All rights reserved.
//

import UIKit

struct MenuItem {
    let itemTitle: String
    let itemSubtitle: String?
    let itemImage: UIImage?
    
    init(_ title: String, subtitle: String?, image: UIImage?) {
        self.itemTitle = title
        self.itemSubtitle = subtitle
        self.itemImage = image
    }
}
