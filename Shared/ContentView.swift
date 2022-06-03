//
//  ContentView.swift
//  Shared
//
//  Created by Inyene Etoedia on 27/05/2022.
//

import SwiftUI

struct ContentView: View {
    
//    init(){
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//    }
     
    
    @State var foodList = [
    FoodModel(foodName:"Rice", loactionName: "Bariga", foodImage: "foodA"),
    FoodModel(foodName:"Beans and Rice", loactionName: "Sabo", foodImage: "foodB"),
    FoodModel(foodName:"Jollof rice", loactionName: "Ikeja", foodImage: "foodC"),
    FoodModel(foodName:"Fish Stew", loactionName: "Magodo", foodImage: "foodD"),
    FoodModel(foodName:"Fish Stew", loactionName: "Magodo", foodImage: "foodD"),
    FoodModel(foodName:"Jollof rice", loactionName: "Ikeja", foodImage: "foodC"),
    ]
    
    
    var body: some View {
        
      
 
        NavigationView {
            List{
                ForEach(foodList.indices, id: \.self){ index in
            
                    NavigationLink(destination: FoodDetails(foodModel: foodList[index])) {
                        FoodView(foodModel: $foodList[index])
                    }
                  
                
                }
                .listRowSeparator(.hidden)
               
            }
           
            .listStyle(.plain)
            .onAppear{
                UITableView.appearance().showsVerticalScrollIndicator = false
        }
            .navigationTitle("Food List")
            .navigationBarTitleDisplayMode(.automatic)
    
        }
     
      
        
    }
}




// MARK: - Section 2

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environment(\.colorScheme, .dark)
//    }
//}
