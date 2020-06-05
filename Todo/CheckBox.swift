//
//  CheckBox.swift
//  Todo
//
//  Created by user.name on 2020/05/12.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct CheckBox<Label>: View where Label: View{
    @Binding var checked: Bool
    
    private var label: ()-> Label
    
    public init(checked: Binding<Bool>,
                @ViewBuilder label: @escaping ()-> Label) {
        self._checked = checked
        self.label = label
    }

    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    self.checked.toggle()
            }
            label()
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CheckBox(checked: .constant(false)) {
                Text("牛乳を買う")
            }
            CheckBox(checked: .constant(true)) {
                Image(systemName: "hand.thumbsup")
            }
            CheckBox(checked: .constant(true)) {
                Image(systemName: "hand.thumbsup")
                Text("牛乳を買う")
                Text("牛乳を買う")
            }
            
        }
    }
}

