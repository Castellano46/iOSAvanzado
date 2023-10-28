//
//  HeroCellView.swift
//  DragonBalliOSAvanzado
//
//  Created by Pedro on 16/10/23.
//

import UIKit
import Kingfisher

class HeroCellView: UITableViewCell {
    static let identifier: String = "HeroCellView"
    static let estimatedHeight: CGFloat = 256

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var heroDescription: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        name.text = nil
        photo.image = nil
        heroDescription.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configuración para la apariencia de la celda
        containerView.layer.cornerRadius = 8.0
        containerView.layer.shadowColor = UIColor.yellow.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 8.0
        containerView.layer.shadowOpacity = 0.4

        photo.layer.cornerRadius = 8.0
        photo.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]

        selectionStyle = .none
    }

    func updateView(
        name: String? = nil,
        photo: String? = nil,
        description: String? = nil
    ) {
        self.name.text = name
        self.heroDescription.text = description
        self.photo.kf.setImage(with: URL(string: photo ?? ""))
    }
}
