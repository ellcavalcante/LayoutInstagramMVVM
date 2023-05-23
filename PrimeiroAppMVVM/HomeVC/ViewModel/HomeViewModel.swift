//
//  HomeViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import Foundation

class HomeViewModel {
    
    private var posts = [
    Posts(profileImage: "img2", userName: "Jack", postImage: "post1"),
    Posts(profileImage: "img4", userName: "Samuel", postImage: "post2"),
    Posts(profileImage: "img3", userName: "Carolina", postImage: "post3"),
    Posts(profileImage: "img6", userName: "Puggy_101", postImage: "post4"),
    ]
    
    private var story = [
    Stories(image: "img1", userName: "Add Story"),
    Stories(image: "img2", userName: "Jack"),
    Stories(image: "img3", userName: "Carolina"),
    Stories(image: "img4", userName: "Samuel"),
    Stories(image: "img5", userName: "Ariana Josep"),
    Stories(image: "img6", userName: "Puggy_101"),
    Stories(image: "img7", userName: "Dheeraj_ks"),
    ]
    
    public var getListPosts: [Posts] {
        return posts
    }
    
    public var getListStory: [Stories] {
        return story
    }
    
    public var numberOfItemsInSection: Int {
        return story.count
    }
    
    public func sizeForItemAt(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
    
}
