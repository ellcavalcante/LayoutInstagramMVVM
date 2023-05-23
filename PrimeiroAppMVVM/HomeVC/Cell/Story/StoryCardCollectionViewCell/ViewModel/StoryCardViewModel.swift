//
//  StoryCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class StoryCardViewModel: NSObject {
    
    private var listStory: [Stories]

    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    public var numberOfItemsInSection: Int {
        return listStory.count
    }
    
    func loudCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
}
