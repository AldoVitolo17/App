import SwiftUI

struct MenuView: View {
    @EnvironmentObject var sharedData: SharedData

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("In Progress")) {
                        ForEach(sharedData.inProgressItems, id: \.self) { item in
                            Text(item)
                        }
                    }
                    Section(header: Text("Completed")) {
                        ForEach(sharedData.completedItems, id: \.self) { item in
                            Text(item)
                        }
                    }
                }
            }
            .navigationBarTitle("Your Luggage")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sharedData.isAddingItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sharedData.isAddingItem) {
                TemplatesView()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(SharedData())
    }
}
