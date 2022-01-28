//
//  RedditCloneViewModel.swift
//  RedditClone
//
//  Created by Oğulcan Aslan on 27.01.2022.
//

import Foundation

class RedditCloneViewModel {
    
    var networkManager = NetworkManager()
    var response: Response?
    
    func getDataList(completion: @escaping () -> Void) {
        networkManager.getDataList { [weak self] (result) in
            guard let result = result else { return }
            self?.response = result
            completion()
        }
    }
    
}
