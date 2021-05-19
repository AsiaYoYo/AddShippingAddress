//
//  ContentView.swift
//  AddShippingAddress
//
//  Created by Asia on 2021/5/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var tagIndex = 0
    @State private var showAlert = false
    
    let tags = ["家", "学校", "公司"]
    
    var confirmMsg: String{
        """
        收货人: \(name)
        手机是: \(phone)
        地址是: \(address)
        标签是: \(tags[tagIndex])
        """
    }
    
    var invaildInput: Bool{
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
    
    var body: some View {
        NavigationView{
        Form{
            Section{
                HStack{
                    Text("收货人")
                    TextField("请填写收货人姓名", text: $name)
                }
                HStack{
                    Text("手机")
                    TextField("请填写收货人手机号", text: $phone)
                        .keyboardType(.numberPad)
                }
                HStack{
                    Text("详细地址")
                    TextField("请填写收货人地址", text: $address)
                }
            }
            
            Section(header: Text("标签")){
                Picker("标签", selection: $tagIndex) {
                    ForEach(0..<tags.count, id: \.self){ index in
                        Text(self.tags[index])
                        
                    }
                    
                }
            .pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                Button("添加"){
                    self.showAlert = true
                }
                .disabled(invaildInput)
            }

        }
        .navigationTitle("新增收货地址")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("确认地址"),
                message: Text(confirmMsg),
                dismissButton: .default(Text("确认"))
            )
        }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
