import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var hex: String = ""
    @State private var bin: String = ""
    
    var body: some View {
        Spacer()
        List {
            VStack {
                Text("Text:")
                TextEditor(text: $text)
            }
            
            VStack {
                Text("Hex:")
                TextEditor(text: $hex).multilineTextAlignment(.center).disabled(true).onChange(of: text) { newValue in
                    onTextChanged(to: newValue, for: .hexadecimal, in: $hex)
                }
            }.shadow(radius: 1)
            
            VStack {
                Text("Bin:")
                TextEditor(text: $bin).multilineTextAlignment(.center).disabled(true).onChange(of: text) { newValue in
                    onTextChanged(to: newValue, for: .binary, in: $bin)
                }
                }
                
            }.shadow(radius: 1)
            
       
        }
}
    
    
    func onTextChanged(to value: String, for system: NumberSystem, in field: Binding<String>) {
        do {
            try field.wrappedValue = system == .binary ? convertToBin(str: value) :  convertToHex(str: value)
        }
        catch {
            field.wrappedValue = "Invalid value"
        }
        
    
    }
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
