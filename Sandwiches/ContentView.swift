//
//  ContentView.swift
//  Sandwiches
//
//  Created by Rafael Gonzaga on 28/09/23.
//


import SwiftUI

struct ContentView: View {
    /// 1 - Passando o array de dados  vazio criados aqui.
    
    
    ///33 - Mudamos essa    var sandwiches: [Sandwich] = [] para    var store: SandwinchStore com @ObservedObject, e em todos sandwiches devemos chamar apartir da var store dessa forma, store.sandwiches
    //var sandwiches: [Sandwich] = []
  @ObservedObject  var store: SandwinchStore

    
    var body: some View {
       /// 3 - Passo a variavel que recebe o array vazio
       
        ///6 - Adicioando um titulo
        NavigationStack{
            
            List {
                ForEach(store.sandwiches) { item in
                    
                    HStack {
                        
                        SandwichCell(item: item)
                        
                    }
                }
                
            ///36 - Chamando as funcoes
            
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                
                ///11 - Criando um Text que tem a contagem dos Sandwiches.
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundStyle(.secondary)
                    Spacer()
                    
                    .listRowSeparator(.visible)
                }
            }
         
            
            ///7 - Escrevendo o titulo.
            .navigationTitle("Sandwiches")
           
            
            /// 37 - Adicionando um Toolbar,  button Edition para o acesso as funcoes excluir e mover.
          .toolbar {

                ToolbarItem(placement: .topBarLeading) {
            #if os(iOS)
           EditButton()
            #endif
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ///38 - Botao para add novo Sandwich
                    Button("Add", action: makeSandwich)
                }
            }
         
            /// 34 -  Criando um Text
            Text("Select a sandwich")
                .font(.largeTitle)
        }
       
    }
    
    ///35 - Criando funcoes para fazer, mover e deletar
    
    func makeSandwich() {
        withAnimation{
            store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int){
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
    
}

#Preview {
    /// 2 - Passando o array de dados para o preview

    ///34 - E agora passar store: testStore para o preview
    ContentView(store: testStore)
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
