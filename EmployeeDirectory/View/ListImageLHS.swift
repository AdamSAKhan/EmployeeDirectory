//
//  ListImageLHS.swift
//  EmployeeDirectory
//
//  Created by Adam Khan on 19/12/2022.
//

import SwiftUI

struct ListImageLHS: View {
    @StateObject private var vm: ImageLoadingVM
    
    init(url: String, key: String) {
        _vm = StateObject(wrappedValue: ImageLoadingVM(url, uuid: key))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
            }
            else {
                ProgressView()
            }
        }
        .frame(maxWidth: 100, maxHeight: 100)
    }}

struct ListImageLHS_Previews: PreviewProvider {
    static var previews: some View {
        ListImageLHS(url: "https://images.pokemontcg.io/pl3/symbol.png", key: "5")
    }
}


