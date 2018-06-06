//
//  Animals.swift
//  EcomNew
//
//  Created by Chhaya Tiwari on 6/4/18.
//  Copyright © 2018 ChhayaTiwari. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Animals

struct Animals {
    
    // MARK: Properties
    
    let name: String
    let imageName: String
    
    static let NameKey = "NameKey"
    static let ImageNameKey = "ImageNameKey"
    
    // MARK: Initializer
    
    // Generate a Animal from a two entry dictionary
    
    init(dictionary: [String : String]) {
        
        self.name = dictionary[Animals.NameKey]!
        self.imageName = dictionary[Animals.ImageNameKey]!
    }
}

// MARK: - Animals (All Animals)

/**
 * This extension adds static variable allAnimals. An array of Animal objects
 */

extension Animals {
    
    // Generate an array full of all of the villains in
    static var allAnimals: [Animals] {
        
        var animalArray = [Animals]()
        
        for d in Animals.localAnimalData() {
            animalArray.append(Animals(dictionary: d))
        }
        
        return animalArray
    }
    
    static func localAnimalData() -> [[String : String]] {
        return [
            [Animals.NameKey : "Cat", Animals.ImageNameKey : "a1"],
            [Animals.NameKey : "Dog", Animals.ImageNameKey : "a2"],
            [Animals.NameKey : "Duck", Animals.ImageNameKey : "a3"],
            [Animals.NameKey : "Dog2", Animals.ImageNameKey : "a4"],
            [Animals.NameKey : "Sheep", Animals.ImageNameKey : "a5"],
            [Animals.NameKey : "Cat", Animals.ImageNameKey : "a1"],
            [Animals.NameKey : "Dog", Animals.ImageNameKey : "a2"],
            [Animals.NameKey : "Duck", Animals.ImageNameKey : "a3"],
            [Animals.NameKey : "Dog2", Animals.ImageNameKey : "a4"],
            [Animals.NameKey : "Sheep", Animals.ImageNameKey : "a5"],
            [Animals.NameKey : "Cat", Animals.ImageNameKey : "a1"],
            [Animals.NameKey : "Dog", Animals.ImageNameKey : "a2"],
            [Animals.NameKey : "Duck", Animals.ImageNameKey : "a3"],
            [Animals.NameKey : "Dog2", Animals.ImageNameKey : "a4"],
            [Animals.NameKey : "Sheep", Animals.ImageNameKey : "a5"]
        ]
    }
}

