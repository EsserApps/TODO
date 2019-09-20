//
//  NewTODOView.swift
//  TODO
//
//  Created by Sebastian Esser on 9/19/19.
//  Copyright © 2019 Sebastian Esser. All rights reserved.
//

import SwiftUI

struct NewTODOView: View {
    
    @State private var newTODO = ""
    
    @ObservedObject var session = FirebaseSession()
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("TODO:")
                    TextField("Enter TODO", text: $newTODO)
                        .padding()
                }
                Button(action: {
                    self.addTODO()
                }) {
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func addTODO() {
        if !newTODO.isEmpty {
            //Add TODO to Firebase
            session.uploadTODO(todo: newTODO)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTODOView_Previews: PreviewProvider {
    static var previews: some View {
        NewTODOView()
    }
}
