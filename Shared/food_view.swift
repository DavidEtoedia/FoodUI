//
//  food_view.swift
//  FoodUI
//
//  Created by Inyene Etoedia on 29/05/2022.
//

import Foundation
import SwiftUI


struct FoodView: View {
    
   
    
    @Binding var foodModel : FoodModel
    
    @State private var showOption = false
    @State private var showError = false
    @State private var isSelected: Bool = false
    
    
    var body: some View{
        HStack {
            Image(foodModel.foodImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height:150)
                .cornerRadius(10)
                .padding(.vertical, 10)
            
                .shadow(color: .gray, radius: 2, x: 0, y: 3)
            
                .onTapGesture {
                    showOption.toggle()
                
                }
                .actionSheet(isPresented: $showOption){
                    ActionSheet(title: Text(foodModel.foodName), message: nil, buttons: [
                        .default(Text("Reserve a Table")){
                            self.showError.toggle()
                        },
                        .default(Text("Mark as Favourite")){},
                        .cancel()
                    ])
                }
                .alert(isPresented: $showError){
                    Alert(title:
                            isSelected == false ?
                          Text("Not available in your country") :
                            Text("Now Available"),
                             message: Text("Not available, try again later"), primaryButton: .default(Text("ok")),
                          secondaryButton: .cancel()
                    )
            }

                VStack(alignment: .leading, spacing: 5){
                    Text(foodModel.foodName)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                    Text(foodModel.locationName)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.gray)
                    
                 
                    
                }
                .padding()
                Spacer()
               
               
                    Image(systemName: "heart.fill")
                        .foregroundColor(isSelected ? .blue : .gray)
                         .font(.system(size: 25))
                         .onTapGesture {
                             isSelected.toggle()
                         }
                    
              
              
                    
        
            
        }
//        HStack {
//            VStack(alignment: .leading, spacing: 5){
//                Text(foodModel.foodName)
//                    .font(.system(size: 20, weight: .medium))
//                    .foregroundColor(.black)
//                Text(foodModel.locationName)
//                    .font(.system(size: 20, weight: .medium))
//                    .foregroundColor(.gray)
//
//
//
//            }
//            .padding()
//            Spacer()
//
//            if (isSelected == false){
//                Image(systemName: "heart.fill")
//                     .foregroundColor(Color.gray)
//                     .font(.system(size: 25))
//                     .onTapGesture {
//                         isSelected.toggle()
//                     }
//
//            } else{
//                Image(systemName: "heart.fill")
//                     .foregroundColor(Color.blue)
//                     .font(.system(size: 25))
//                     .onTapGesture {
//                         isSelected.toggle()
//                     }
//            }
//
//
//        }
        
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
