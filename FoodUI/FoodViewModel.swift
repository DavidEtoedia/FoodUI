//
//  FoodViewModel.swift
//  FoodUI
//
//  Created by Inyene Etoedia on 07/10/2022.
//

import Foundation
import SwiftUI
import Combine

class FoodViewModel : ObservableObject{
    @Published var isLoading: Bool = false
    @Published var success: Bool = false
    @Published var foodList: [FoodModel] = []
    
    @Published var filtered: [FoodModel] = []
    
    @Published var mapped: [String] = []
    @Published var search: String = ""
    
 
    private var cancellables = Set<AnyCancellable>()
    
    
    // INITIALIZE THE LIST BY GETTING IT
     init(){
        getFoodList()
     searchList()
        
//         sortByLocation()
    }
    // SORT BY FAVORITE
    func sortByLocation(){
        
        // FIRST METHOD TO SORT - WELL EXPLICIT
//        filtered = foodList.sorted{(food1, food2) -> Bool in
//            return food1.isFavorite != food2.isFavorite
//        }
        
        // SECOND METHOD TO SORT- STRAIGHT FORWARD
//        filtered = foodList.sorted(by: {$0.isFavorite != $1.isFavorite})
        
        // FIRST METHOD TO FILTER
//        filtered = foodList.filter({(food) -> Bool in
//            return food.isFavorite
//
//        })
        
        // SECOND METHOD TO FILTER
//        filtered = foodList.filter({!$0.isFavorite})
        
        // FIRST METHOD TO COMPACT MAP
        mapped = foodList.compactMap({ (food) -> String in
            return food.foodName
        })
        
        // SECOND METHOD TO COMPACT MAP
        mapped = foodList.compactMap({$0.foodName})
        
        
    }
    
    
    
//    var foodList : [FoodModel] {
//        if self.search.isEmpty{
//            return foodList
//        } else {
//            return foodList.filter({$0.foodName.localizedCaseInsensitiveContains(search)})
//        }
//
//    }
    
    
    func searchList(){
        
       
        $search.combineLatest(self.$foodList).map { (text, food) -> [FoodModel] in
          if text.isEmpty {
              self.foodList = self.filtered
              return   self.foodList
          } else{
              print(self.search)
              return food.filter({$0.foodName.localizedCaseInsensitiveContains(text)})
          }


        }
        .sink {(value) in
            self.foodList = value

        }
        .store(in: &cancellables)
    }
        
    

    

    
    
    func getFoodList() {
            self.foodList.append(contentsOf: [
            FoodModel(foodName: "Agbado", location: "Bariga", description: "i love samosa", isFavorite: true, image: "food1"), FoodModel(foodName: "Ewa", location: "Yaba", description: "i love samosa", isFavorite: true, image: "food2"),FoodModel(foodName: "Garri", location: "Ikeja", description: "i love samosa", isFavorite: false, image: "food3"),FoodModel(foodName: "Semo", location: "Ikeja", description: "i love samosa", isFavorite: true, image: "food4"),FoodModel(foodName: "Cassava", location: "Yaba", description: "i love samosa", isFavorite: false, image: "food5")])
        self.filtered = self.foodList
      
            }
    
    func toggleLike(index: Int){
        self.foodList[index].isFavorite.toggle()
        
    }
   
    
    func addFood(name: String, image: String, location: String){
        self.isLoading = true
        self.success = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.foodList.append(FoodModel(foodName: name, location: location, description: "I love Food", isFavorite: false, image: "food" + image))
            self.isLoading = false
            self.success = true
           
            }
    }
}
