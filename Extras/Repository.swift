//
//  Repository.swift
//  FYP
//
//  Created by Armani on 16/01/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

class Repository: NSObject {

    var repoName : String
    var repoTitle : String
    var repoDescription : String
    var avatarImage : UIImage
    
    
    init(repoName : String, repoTitle : String, repoDescription : String, avatarImage : UIImage) {
        self.repoName = repoName
        self.repoTitle = repoTitle
        self.repoDescription = repoDescription
        self.avatarImage = avatarImage
    }
}
