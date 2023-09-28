//
//  ContentView.swift
//  Sandwiches
//
//  Created by Rafael Gonzaga on 28/09/23.
//


import SwiftUI

struct ContentView: View {
    /// 1 - Passando o array de dados  vazio criados aqui.
    
    var sandwiches: [Sandwich] = []
    
    var body: some View {
       /// 3 - Passo a variavel que recebe o array vazio
       
        ///6 - Adicioando um titulo
        NavigationStack{
            
            List {
                ForEach(sandwiches) { item in
                    
                    HStack {
                        
                        SandwichCell(item: item)
                        
                    }
                }
                
                ///11 - Criando um Text que tem a contagem dos Sandwiches.
                HStack {
                    Spacer()
                    Text("\(sandwiches.count) Sandwiches")
                        .foregroundStyle(.secondary)
                    Spacer()
                    
                    .listRowSeparator(.visible)
                }
            }
         
            
            ///7 - Escrevendo o titulo.
            .navigationTitle("Sandwiches")
        }
       
    }
}

#Preview {
    /// 2 - Passando o array de dados para o preview

    ContentView(sandwiches: testData)
}

//9 - A view que foi extraida da lista
struct SandwichCell: View {
    
    /// 10 Temos que passar o item aqui. E depois passar na view acima.
    
    var item: Sandwich
    
    
    var body: some View {
        
        ///8 - Adicionando uma navigation Link passando item.name
        ///15 - Passamos aqui a DatailView Criada na destination
        NavigationLink(destination:SandwichDetail(sandwich: item)) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(3.0)
            
            VStack(alignment: .leading) {
                
                /// 4 - Aqui consigo acessar o titulo, chamndo item.name
                Text(item.name)
                
                ///5 - Aqui consigo acessar o numero de ingredientes por meio de uma interpolação, devido o ingredientCont ser do tipo Int.
                Text("\(item.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
