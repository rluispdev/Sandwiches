//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Rafael Gonzaga on 28/09/23.
//

import SwiftUI

struct SandwichDetail: View {
    
    ///18 - Criando um zoom no aspectRatio
    @State private var zoomed = false
    
    ///12 - Criada a SandwichDetail, e primeiro  passamos a var sandwich
    var sandwich: Sandwich
    
    var body: some View {
        
       ///22 - Adicionamos um VStack e passamos o 16  e o 20 pra traz dele.
        VStack {
            
            /// 25 - Adicionando o   Spacer(minLength: 0)
            Spacer(minLength: 0)
            
            ///14 - Criamos a imagem para passar como destino do NavigationView
            Image(sandwich.imageName)
                .resizable()
            
            ///19 - criando um zoom aqui. Usanndo ? e :
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    
                    ///21 - Adicioando uma animacao com withAnimation { }
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            
            /// 24 - Adicionando o   Spacer(minLength: 0)
            Spacer(minLength: 0)
            
            ///29 - Adicioanamos    if sandwich.isSpicy  na Label + modificadores
            if sandwich.isSpicy {
                ///27 - Criamos um HStack para Label e adicionamos 2 Spacer( ) para centralizar.
                HStack{
                    
                    Spacer()
                    ///23 - Criamos uma Label com icon
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                
                ///26 - Adicionando um padding(.all) , uma font ,  background  e foregroundColor na label.
                .padding(.all)
                
                ///28 - Adicionamos Maiusculas a font -  .font(Font.headline.smallCaps())
                .font(Font.headline.smallCaps())
                .background(.red)
                .foregroundColor(.yellow)
            }
        }
        /// 16 - Adicionando um Navigation Title
                      .navigationTitle(sandwich.name)
                  ///20 - Adicionar o ignoreSafeArea - Novo  .ignoresSafeArea(.all, edges: .bottom)
                  .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    
    ///13 - Passando no Preview tbm!
    ///17 - Adicionando uma navigation Stack
    NavigationStack {
        SandwichDetail(sandwich: testData[0])
    }
}
