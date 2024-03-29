//
//  CatsDataSource.swift
//  RandomCatGif
//
//  Created by Erick Olibo on 05/09/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import UIKit

class CatDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    private let cellIdentifier = "CatGifCell"
    var cats = [Cat]()
    
    var dataChanged: (() -> Void)?
    
    func fetch(_ urlString: String) {
        let decoder = JSONDecoder()
        
        let url = URL(string: urlString)!
        
        decoder.decodeJSON([Cat].self, fromURL: url) { cats in
            self.cats = cats
            self.dataChanged?()

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CatGifCell
        let cat = cats[indexPath.row]
        cell.cat = cat
        return cell
    }
    
    
    
    
    
}
