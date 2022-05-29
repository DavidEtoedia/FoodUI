//
//  ContentView.swift
//  Shared
//
//  Created by Inyene Etoedia on 27/05/2022.
//

import SwiftUI

struct ContentView: View {
     
    var food = ["foodA", "foodB", "foodC", "foodD"]
    var foodName = ["Super Dinner Chow", "Exquisite chow", "Palatable chow", "New palatable chow"]
    var locationName = ["Lagos", "Ibadan", "Akwa Ibo", "Ekiti"]
    
    
    var body: some View {
        List{
            ForEach(food.indices, id: \.self){ index in
        
            FoodView(foodImage: food[index], foodName: foodName[index], locationName: locationName[index])
              
            
            }
            .listRowSeparator(.hidden)
           
        }
       
        .listStyle(.plain)
        .onAppear{
            UITableView.appearance().showsVerticalScrollIndicator = false
        }
        
      
        
    }
}


struct FoodView: View {
    var foodImage: String
    var foodName: String
    var locationName: String
    
    @State private var showOption = false
    
    
    var body: some View{
        Image(foodImage)
            .resizable()
            .scaledToFill()
            .frame(height:200)
            .padding(.vertical, 10)
            .shadow(color: .gray, radius: 2, x: 0, y: 3)
            .onTapGesture {
                showOption.toggle()
            
            }
            .actionSheet(isPresented: $showOption){
                ActionSheet(title: Text(foodName), message: nil, buttons: [
                    .default(Text("Reserve a Table")){},
                    .default(Text("Mark as Favourite")){},
                    .cancel()
                ])
            }
        VStack(alignment: .leading, spacing: 5){
            Text(foodName)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)
            Text(locationName)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.gray)
            
         
            
        }
        .padding()
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
