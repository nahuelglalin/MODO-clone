//
//  VCPreview.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import SwiftUI

struct VCPreview<T: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: T
    
    init(_ viewControllerBuilder: @escaping () -> T){
        viewController = viewControllerBuilder()
    }
    
    func makeUIViewController(context: Context) -> T {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) {}
    
}


struct ViewPreview<T: UIView>: UIViewRepresentable {
   
    let view: T
    
    init(_ viewBuilder: @escaping () -> T){
        view = viewBuilder()
    }
    
    func makeUIView(context: Context) -> T {
        view
    }
    
    func updateUIView(_ uiView: T, context: Context) {}
    
}
