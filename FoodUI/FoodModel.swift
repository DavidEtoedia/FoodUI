//
//  FoodModel.swift
//  FoodUI
//
//  Created by Inyene Etoedia on 07/10/2022.
//
import Foundation

struct FoodModel{
    var foodName: String
    var description: String
    var location: String
    var image: String
    var isFavorite: Bool
    //Designated Initializer
    init(foodName: String, location: String, description: String, isFavorite: Bool, image: String){
        self.foodName = foodName
        self.description = description
        self.location = location
        self.isFavorite = isFavorite
        self.image = image
    }
    
    init(){
        self.init(foodName: "", location: "", description: "", isFavorite: false, image: "")
    }
    
}


