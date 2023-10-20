import SwiftUI

struct CreateNewBagView: View {
    @EnvironmentObject var sharedData: SharedData

    @State private var newItem = ""

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("What you want to bring?", text: $newItem)
                        .autocapitalization(.none)
                }
                Section {
                    ForEach(sharedData.insertedItem, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("New Bag")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                        let answer = newItem.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        guard answer.count > 0 else { return }

                        withAnimation {
                            sharedData.insertedItem.insert(answer, at: 0)
                        }
                        newItem = ""

                        sharedData.isAddingItem = false
                    }
                }
            }
            .onSubmit {
                let answer = newItem.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                guard answer.count > 0 else { return }

                withAnimation {
                    sharedData.insertedItem.insert(answer, at: 0)
                }
                newItem = ""
            }
        }
    }

    func delete(at offsets: IndexSet) {
        sharedData.insertedItem.remove(atOffsets: offsets)
    }
}

struct CreateNewBagView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewBagView().environmentObject(SharedData())
    }
}
