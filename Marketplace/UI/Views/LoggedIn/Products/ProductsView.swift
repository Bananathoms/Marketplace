//
//  ProductView.swift
//  Marketplace
//
//  Created by CESI on 18/11/2022.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var productsVM = ProductsViewModel()
    
    let subcategory: Subcategory
    

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0){

            ButtonBack(title: subcategory.name ?? "Unknown", size: 30)
                .padding(.top, 40)
                .padding(.bottom, 10)
            
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 0) {
                    
                    ForEach(productsVM.productsArray, id: \.id) { product in

                        NavigationLink(destination: ProductDetailedView(product: product)){
                            ProductButton(name: product.name ?? "unknown", price: product.price ?? 0, url: (product.pictures?.first?.image?.url))
                        }
                           }
                       }
                       .padding(.horizontal)
                   }
          
            Spacer()
     
        }.background(Color.mainColor)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
            .onAppear(){
                productsVM.getProducts(subcategory: subcategory)
            }
    }
    
    
    struct ProductsView_Previews: PreviewProvider {
        static var previews: some View {
            ProductsView(subcategory: PreviewData.subcategory)
        }
    }
}
