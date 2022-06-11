//
//  NotificationTableViewCell.swift
//  hm-table
//
//  Created by Виктор Ковалевский on 11.06.2022.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    static let identifier = "NotificationTableViewCell"


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
        label.numberOfLines = 1
        return label
    }()

    private let labelContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()

    private let additionalLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(labelContainer)
        labelContainer.addSubview(additionalLabel)

        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

        additionalLabel.textColor = .white

        additionalLabel.font = additionalLabel.font.withSize(22)


    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)

        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height
                             )

        labelContainer.frame = CGRect(
            x: (contentView.frame.size.width - labelContainer.frame.size.width - 40),
            y: (contentView.frame.size.height - labelContainer.frame.size.height)/6,
            width: size,
            height: size)

        additionalLabel.frame = CGRect(x: labelContainer.frame.size.width - 21, y: 8, width: 15, height: 15)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        additionalLabel.text = nil
    }


    public func configure(with model: SettingsNotificationOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        labelContainer.backgroundColor = model.labelContainerBackgroundColor
        additionalLabel.text = model.addLabelText
    }



}
