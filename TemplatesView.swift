import SwiftUI

struct TemplatesView: View {
    @EnvironmentObject var sharedData: SharedData

    var body: some View {
        NavigationView {
            List {
                
                Section {
                    NavigationLink(destination: CreateNewBagView()) {
                        Text("Create an empty list")
                            .onTapGesture {
                                sharedData.isAddingItem = true
                        }
                    }
                }
                Section(header: Text("Templates")){
                    Text("Template 1")
                    Text("Template 2")
                    // Altri elementi del tuo elenco di modelli
                }
            }
            .navigationBarTitle("New Bag")
        }
    }
}

struct TemplatesView_Previews: PreviewProvider {
    static var previews: some View {
        TemplatesView().environmentObject(SharedData())
    }
}
