//
//  ContentView.swift
//  FoodUI
//
//  Created by Inyene Etoedia on 07/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresent = false
    // STATEOBJECT -> used for creation or when yo starting up an app. it caches and holds the data compared to OBSERVABLEOBJECT.
    // OBSERVEDOBJECT -> used for displaying a details screen and for subviews
   @EnvironmentObject var foodViewModel :  FoodViewModel

    @State private var textFieldState: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack() {
                
               
                    
               
                    Spacer()
                TextField("Search", text: $foodViewModel.search)
                        .padding([.horizontal], 20)
                        .padding(.vertical)
                      
                        .background(Color.gray.opacity(0.1))
                        .foregroundColor(Color.red)
                        .padding([.horizontal], 20)
               
                
                List{
                    ForEach(foodViewModel.foodList.indices, id: \.self) { index in
                       
                        ZStack (alignment: .leading) {
                            NavigationLink(destination: FoodDetails(foodViewModel: foodViewModel.foodList[index], index: index)) {
                                EmptyView()
                                
                               
                            }
//                            .opacity(0)
                            HStack {
                                Image(foodViewModel.foodList[index].image)
                                    .resizable()
                                    .frame(width: 120, height: 118)
                                    .cornerRadius(10)
                                VStack (alignment: .leading){
                                    Text(foodViewModel.foodList[index].foodName)
                                        .font(.system(size: 22))
                                    Text(foodViewModel.foodList[index].location)
                                        .font(.system(.subheadline))
                                        .foregroundColor(Color.gray)
                                }
                                
                                
                                
                                Image(systemName: "heart.fill")
                                    .foregroundColor(
                                        foodViewModel.foodList[index].isFavorite ?
                                        Color.blue : Color.yellow )
                                    .font(.system(size: 30))
                                    .onTapGesture {
                                        foodViewModel.toggleLike(index: index)
                                     
                                    }
                            }
                           
                            
                        }
                    }
                    .listRowSeparator(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.07))
                    
                    
                   
                    
                }
                .listStyle(.plain)
                .navigationTitle("Food View")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(trailing: AddButton() )
                
                
             
            }
            .environmentObject(foodViewModel)
        }
       
        
     
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FoodViewModel())
    }
}

struct AddButton: View {
    
    @State var isPresent: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var foodViewModel : FoodViewModel
    var body: some View {
        Button("Add Food"){
            self.isPresent = true
            
           
            
        }
        .sheet(isPresented: $isPresent,onDismiss: {
           
        } ,content: {
            ModalSheet()
            
           
            
        }
               
            
        )
    
    }
}

struct ModalSheet: View {
    @State private var foodnameController: String = ""
    @State private var imageController: String = ""
    @State private var locationController: String = ""
    @EnvironmentObject var foodViewModel : FoodViewModel
    @Environment(\.presentationMode) var presentationMode
   
    var body: some View {
    
      
        
        VStack(spacing: 20) {
          
            Text("Add New Food")
                .font(.system(size: 30,weight: .bold ))
                .padding(.vertical)
            
     
            TextField("Add Food", text: $foodnameController)
                .padding([.horizontal], 20)
                .padding(.vertical)
              
                .background(Color.gray.opacity(0.1))
                .foregroundColor(Color.red)
                .padding([.horizontal], 20)
            TextField("Add Image", text: $imageController )
                .padding([.horizontal], 20)
                .padding(.vertical)
              
                .background(Color.gray.opacity(0.1))
                .foregroundColor(Color.red)
                .padding([.horizontal], 20)
            TextField("Add Location", text: $locationController)
                .padding([.horizontal], 20)
                .padding(.vertical)
              
                .background(Color.gray.opacity(0.1))
                .foregroundColor(Color.red)
                .padding([.horizontal], 20)
            
          Button(
            action: {
                if (foodnameController.isEmpty){}
//               
                foodViewModel.addFood(name: foodnameController, image: imageController, location: locationController)
//                presentationMode.wrappedValue.dismiss()
            }, label: {
                
                if foodViewModel.isLoading {
                      ProgressView()
                } else{
                    Text("SAVE")
                        .padding([.horizontal], 100)
                        .padding([.vertical], 15)
                      
                        .font(.system(size: 20, weight: .regular))
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(Color.white)
                }
                
              
                  
            }
          ).onChange ( of: foodViewModel.success){ newValue in
              if (newValue){
                  presentationMode.wrappedValue.dismiss()
              }
          }
           
            
            
        }
        
        
        
     
    }
}
