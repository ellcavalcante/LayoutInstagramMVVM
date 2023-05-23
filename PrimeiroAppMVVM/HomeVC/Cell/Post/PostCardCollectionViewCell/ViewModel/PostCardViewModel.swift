//
//  PostCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class PostCardViewModel {
    
    private var listPosts: [Posts]

    init(listPosts: [Posts]) {
        self.listPosts = listPosts
    }
    
    public var numberOfItemsInSection: Int {
        return listPosts.count
    }
    
    func loudCurrentPosts(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
}
