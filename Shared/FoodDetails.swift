//
//  FoodDetails.swift
//  FoodUI
//
//  Created by Inyene Etoedia on 03/06/2022.
//

import SwiftUI

struct FoodDetails: View {
    @Environment(\.dismiss) var dismiss
    
    var foodModel : FoodModel

    
    var body: some View {
        
        
        
        VStack(alignment: .leading) {
            Image(foodModel.foodImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 400)
              
                
               
            
            HStack (spacing: 50){
                Text(foodModel.foodName)
                .font(.system(size: 30, weight: .bold))
                
               Image(systemName: "heart.fill")
                    .foregroundColor(.blue)
                     .font(.system(size: 25))
            }
                
            
                
               
        
            Text("To make it translucent, we attach the opacity modifier and set its value to 0.8. the views within ZStack determines the views are layered. In this case, the Color To make it translucent, we attach the opacity modifier and set its value to 0.8. the views within ZStack determines the views are layered. In this case, the Color")
                .padding(.vertical,4)
                
            Spacer()
           
            
          
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {
                    dismiss()
                }){
                    Text("\(Image(systemName: "chevron.left")) \(foodModel.foodName)")
                }
            }
        }
        
        
    }
}

struct FoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetails(foodModel: FoodModel(foodName: "", loactionName: "", foodImage: "foodA"))
    }
}
