//
//  ListImageLHSVM.swift
//  EmployeeDirectory
//
//  Created by Adam Khan on 19/12/2022.
//

import Foundation
import SwiftUI
import Combine

protocol ImageLoadingProtocol {
    func downloadImage(_ urlString: String)
}

class ImageLoadingVM: ObservableObject {
    @Published var image: UIImage? = nil
    var cancelables = Set<AnyCancellable>()
    let manager = PhotoModelCacheManager.instance
    
    let uuid: String
    let urlString: String
    
    init(_ url: String, uuid: String){
        self.urlString = url
        self.uuid = uuid
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.getImage(key: self.uuid) {
            self.image = savedImage
            print("Getting Saved Image")
        }
        else {
            downloadImage(urlString)
            print("Downloading Image")
        }
    }
    
    
}

extension ImageLoadingVM: ImageLoadingProtocol {
    func downloadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink {[weak self] _ in
                
            } receiveValue: { [weak self] (returnedImage) in
                guard let downLoadedImage = returnedImage, let self = self
                else { return }
                self.image = downLoadedImage//UIImage(data: downLoadedImage as! Data)
                self.manager.addImage(key: self.uuid, value: self.image ?? UIImage())
            }
            .store(in: &cancelables)
    }
}
