//
//  CarsView.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import SwiftUI

struct CarsView: View {
    @ObservedObject private var viewModel: CarViewModel
    init(viewModel: CarViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                
                if viewModel.isLoading  {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                        .accentColor(Color.white)
                        .frame(height:UIScreen.main.bounds.height,alignment: .center)
                }else {
                    if ((viewModel.carList?.cars.isEmpty) != nil)  {
                        VStack(alignment: .center, spacing: 30) {
                            Image(systemName: "tray")
                            Text("There are any Cars")
                                .font(.body)
                        }
                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height, alignment: .center)
                        
                    }
                    else if !viewModel.errorTitle.isEmpty{
                        VStack(alignment: .center, spacing: 30) {
                            Image(systemName: "arrow.counterclockwise.icloud.fill")
                            Text(viewModel.errorTitle)
                                .font(.body)
                        }
                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height, alignment: .center)
                        
                    }
                    else {
                        
                        
                        // ScrollView content
                        LazyVStack{
                            ForEach(viewModel.carList?.cars ?? [] , id: \.id){
                                car in
                                
                                VStack{
                                    Text("make : \(car.make)")
                                    Text("model : \(car.model)")
                                    
                                }
                                
                            }
                            
                        }
                        .listStyle(.plain)
                        .background(Color.theme.backgroundColor)
                        .padding(.bottom)
                        .listStyle(.plain)
                        
                        
                    }
                    
                    
                    
                    
                }
                
            }
            
            
            
            
            .navigationTitle("Cars")
            
            
        }
        
        
    }
    
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView(viewModel: CarViewModel(carRepository: CarRepository.inctance as! CarRepository))
    }
}
