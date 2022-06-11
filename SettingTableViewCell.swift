//
//  SettingTableViewCell.swift
//  hm-table
//
//  Created by Виктор Ковалевский on 11.06.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {


    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        // одна стройка метки
        label.numberOfLines = 1
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}
