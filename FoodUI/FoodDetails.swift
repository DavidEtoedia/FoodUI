//
//  FoodDetails.swift
//  FoodUI
//
//  Created by Inyene Etoedia on 07/10/2022.
//

import SwiftUI

struct FoodDetails: View {
    var foodViewModel : FoodModel
    var index : Int
    @EnvironmentObject var foodVm :  FoodViewModel
    var body: some View {
        
        VStack {
            Image(foodViewModel.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(10)
            HStack {
                Text(foodViewModel.foodName)
                
                Image(systemName: "heart.fill")
                    .foregroundColor(
                        foodViewModel.isFavorite ?
                        Color.blue : Color.yellow )
                    .font(.system(size: 30))
                    .onTapGesture {
                        foodVm.toggleLike(index: index)
                        
                    }
            }
            Spacer()
        }
        .padding([.horizontal], 20)
    }
}

//struct FoodDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetails(foodDetail: FoodModel())
//    }
//}
