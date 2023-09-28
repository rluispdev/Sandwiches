//
//  ContentView.swift
//  Sandwiches
//
//  Created by Rafael Gonzaga on 28/09/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    /// 1 - passando o array de dados  vazio criados aqui.
    
    var sandwiches: [Sandwich] = []
    
    var body: some View {
       /// 3 - passo a variavel que recebe o array vazio
        List(sandwiches) { item in
            
            HStack {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                
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
}

#Preview {
    /// 2 - Passando o array de dados para o preview

    ContentView(sandwiches: testData)
}
