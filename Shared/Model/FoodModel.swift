//
//  FoodModel.swift
//  FoodUI (iOS)
//
//  Created by Inyene Etoedia on 31/05/2022.
//

import Foundation
// MARK: - foodModel
struct FoodModel {
    var foodName: String
    var locationName: String
    var foodImage: String
    
    init(foodName: String, loactionName: String, foodImage: String){
        self.foodName = foodName
        self.foodImage = foodImage
        self.locationName = loactionName
        
    }
    
    init(){
        self.init(foodName: "", loactionName: "", foodImage: "")
    }
        
    
    
    
    
    
    
}
