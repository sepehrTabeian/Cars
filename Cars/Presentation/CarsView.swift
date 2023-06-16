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
                    progressView
                    
                }else {
                    if ((viewModel.carList?.cars.isEmpty) != nil)  {
                        
                        emptyCars
                    }
                    else if !viewModel.errorTitle.isEmpty{
                    
                        errorView
                        
                    }
                    else {
                        Cars

                    }
            
                }
                
            }
      
            .navigationTitle("Cars")
            
            
        }
        
        
    }
    
}
extension CarsView {
    var progressView : some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
            .accentColor(Color.white)
            .frame(height:UIScreen.main.bounds.height,alignment: .center)
    }
    var emptyCars : some View {
        VStack(alignment: .center, spacing: 30) {
            Image(systemName: "tray")
            Text("There are any Cars")
                .font(.body)
        }
        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height, alignment: .center)
    }
    var errorView : some View {
        VStack(alignment: .center, spacing: 30) {
            Image(systemName: "arrow.counterclockwise.icloud.fill")
            Text(viewModel.errorTitle)
                .font(.body)
        }
        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height, alignment: .center)
    }
    var Cars : some View {
        LazyVStack{
            ForEach(viewModel.carList?.cars ?? [] , id: \.id){
                car in
                CarsItemView(car: car)
            }
            
        }
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView(viewModel: CarViewModel(carRepository: CarRepository.inctance as! CarRepository))
    }
}
