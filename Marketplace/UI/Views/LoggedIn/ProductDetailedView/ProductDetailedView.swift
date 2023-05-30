//
//  ProductDetailedView.swift
//  Marketplace
//
//  Created by CESI on 19/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import UIKit

struct ProductDetailedView: View {
    
    @StateObject var producDetailedVM = ProductDetailedViewModel()
   
   
    @State private var quantity = 0
    @State private var selection = 0
    @State var fav: Bool = false
    
    let product: Product

    private func sizeBar() -> some View {
        
        HStack(spacing: 0){
            Picker("", selection: $selection) {
                Text("XS")
                    .font(.nunitoRegular())
                    .tag(100)
                Text("S")
                    .font(.nunitoRegular())
                    .tag(101)
                Text("M")
                    .font(.nunitoRegular())
                    .tag(102)
                Text("L")
                    .font(.nunitoRegular())
                    .tag(103)
                Text("XL")
                    .font(.nunitoRegular())
                    .tag(104)
            }.pickerStyle(.segmented)
        }.frame(width: 340)

    }

    var body: some View {
        VStack(alignment: .center, spacing: 0.0){
            
            HStack{
                ButtonBack(title: product.name ?? "Unknown", size: 30)
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                
                Button {
                    self.fav.toggle()
                } label: {
                    Image(systemName: self.fav == true ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(.secondaryColor)
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 20)
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                }
            }

            ScrollView(showsIndicators: false){
                
                TabView(selection: $selection){
                    ForEach(producDetailedVM.pictures, id: \.index) { item in
                        WebImage(url: item.url)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 320)
                            .tag(item.index)
                    }
                }.tabViewStyle(.page(indexDisplayMode: .never))
                
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth  - 40)
                   

                HStack{
                    ForEach(producDetailedVM.pictures, id: \.index) { item in
                        

                        Button {
                            withAnimation{
                                self.selection = item.index
                            }
                           
                        } label: {
                            WebImage(url: item.url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40)
                                .border(self.selection == item.index ? .red : .mainColor, width:4)
                        }
                    }
                }

                HStack{
                    Text("REF.ARTICLE")
                        .font(.nunitoLight(20))
                        .foregroundColor(.secondaryColor)
                        .padding(.leading, 20)
                    
                    Text(product.Reference ?? "####")
                        .font(.nunitoLight(20))
                        .foregroundColor(.secondaryColor)
                        
                    Spacer()
                }
            
                HStack{
                    Text(product.name ?? "Article")
                        .font(.nunitoBold())
                        .foregroundColor(.secondaryColor)
                        
                    Spacer()
                    
                    Text(String(format: "%.2f €", product.price!))
                        .font(.nunitoBold())
                        .foregroundColor(.redCustom)
                        
                }.padding(.horizontal, 20)
                    .padding(.bottom, 5)
                
                HStack{
                    Text("CHOISISSEZ UNE TAILLE")
                        .font(.nunitoRegular(20))
                        .foregroundColor(.secondaryColor)
                        .padding(.leading, 20)
                    Spacer()
                }
                
                sizeBar()
                    .padding(.bottom, 10)
                
                HStack{
                    Text("DESCRIPTION DU PRODUIT")
                        .font(.nunitoRegular(20))
                        .foregroundColor(.secondaryColor)
                        .padding(.leading, 20)
                    Spacer()
                }
                
                Text(product.description?.description ?? "")
                    .font(.nunitoRegular(18))
                    .foregroundColor(.secondaryColor)
                    .padding(.horizontal, 20)
                
                HStack{
                    Stepper("Quantité: \(quantity)", value: $quantity, in: 0...(product.quantityAvailable ?? 0) )
                        .font(.nunitoRegular(20))
                        .foregroundColor(.secondaryColor)
                                            
                }.padding(.horizontal, 20)
                
                TextButton(text: "Ajouter au panier", isLoading: false, onClick: {print("\(quantity) produit(s) ajouté(s) au panier")}, buttonColor: .redCustom, textColor: .white)
            }

        }.background(Color.mainColor)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.top)
            .onAppear{
                producDetailedVM.initPicturesUrl(product: product)
            }
        }
    }


//struct ProductDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailedView(product: PreviewData.product)
//    }
//}
