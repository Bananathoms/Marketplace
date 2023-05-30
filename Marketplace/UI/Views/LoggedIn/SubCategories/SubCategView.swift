//
//  SubCategView.swift
//  Marketplace
//
//  Created by CESI on 17/11/2022.
//

import SwiftUI

struct SubCategView: View {
    
    @StateObject var subCategVM = SubCategoryViewModel()
    
    let category: Category
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0.0){

            ButtonBack(title: category.name ?? "Inconnu", size: 30)
                .padding(.top, 40)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 0.0){
                
                ForEach(subCategVM.subCategoryArray, id: \.id){ subcategory in
                    
                    NavigationLink(destination: ProductsView(subcategory: subcategory)){
                        CategButton(text: subcategory.name ?? "test", url: (subcategory.image?.url)!)
                    }

                }
                Spacer()
            }.background(Color.mainColor)
                .onAppear(){
                    subCategVM.fetchSubcategory(category: category)
                }

        }.background(Color.mainColor)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
    }
}

struct SubCategView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategView(category: PreviewData.category )
    }
}

