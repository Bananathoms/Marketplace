//
//  CategView.swift
//  Marketplace
//
//  Created by CESI on 14/11/2022.
//

import SwiftUI

struct CategView: View {
    
    @ObservedObject var categoryService = CategoryService.current
    
    private func makeHeader() -> some View {
        
        VStack{
            HStack{
                Text("Catégories")
                    .font(.nunitoBold(30))
                    .foregroundColor(.secondaryColor)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                    .frame(alignment: .topLeading)
                Spacer()
            }
        }
    }
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .center, spacing: 0.0){
                makeHeader()
                    .padding(.top, 40)
                
                ForEach(categoryService.categories, id: \.id){ item in
                    
                    NavigationLink(destination: SubCategView(category: item)){
                        CategButton(text: item.name ?? "test", url: (item.image?.url)!)                    }
                }
                Spacer()
            }.background(Color.mainColor)
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct CategView_Previews: PreviewProvider {
    static var previews: some View {
        CategView()
    }
}
