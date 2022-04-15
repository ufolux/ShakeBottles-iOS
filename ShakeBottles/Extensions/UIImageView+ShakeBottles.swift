//
//  UIImageView+ShakeBottles.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import UIKit

extension UIImageView {
    public static let placeholderImg = UIImage(systemName: "photo")!.withRenderingMode(.alwaysOriginal).withTintColor(AppearanceManager.shared.colors.placeholder)
    public func loadImage(from url: URL, placeholder: UIImage = UIImageView.placeholderImg, mode: ContentMode = .scaleAspectFit) -> Void {
        contentMode = mode;
        image = placeholder
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
