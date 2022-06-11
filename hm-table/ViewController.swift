//
//  ViewController.swift
//  hm-table
//
//  Created by Виктор Ковалевский on 11.06.2022.
//

import UIKit

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case addLabelCell(model: SettingsAdditionalLabelOption)
    case notificationCell(model: SettingsNotificationOption)
}

struct SettingsNotificationOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let addLabelText: String
    let handler: (() -> Void)
    let labelContainerBackgroundColor: UIColor
}

struct SettingsAdditionalLabelOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let addLabelText: String
    let handler: (() -> Void)
}


struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    // дополнительное свойство
    var isOn: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        table.register(AdditionalLabelTableViewCell.self, forCellReuseIdentifier: AdditionalLabelTableViewCell.identifier)
        table.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identifier)


        return table
    }()

    var models = [Section]()



    override func viewDidLoad() {
        super.viewDidLoad()
        confifure()
        title = "Настройки"

        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }


    func confifure() {
        models.append((Section(options: [
            SettingsOptionType.switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                print("Вы нажали на авиарежим")
                    }, isOn: true)),
            SettingsOptionType.addLabelCell(model: SettingsAdditionalLabelOption(title: "WiFi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue, addLabelText: "Не подключено", handler: {
                print("Topped first cell")
            })),
            SettingsOptionType.addLabelCell(model: SettingsAdditionalLabelOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemBlue, addLabelText: "Вкл.", handler: {
                print("Topped first cell")
            })),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {

                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                    }),
            SettingsOptionType.switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                print("Вы нажали на авиарежим")
                    }, isOn: true))
        ]))
        )


        models.append((Section(options: [
            SettingsOptionType.staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
            }),
        ]))
        )

        models.append((Section(options: [
            SettingsOptionType.notificationCell(model: SettingsNotificationOption(title: "Основные", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue, addLabelText: "1", handler: {

            }, labelContainerBackgroundColor: .systemRed)
                                               ),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {

                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {

                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {

            }),
        ]))
        )

    }




    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.section].options[indexPath.row]
            switch model.self {

            case .staticCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SettingTableViewCell.identifier,
                    for: indexPath
                ) as? SettingTableViewCell else  {
                    return UITableViewCell()
                }
                cell.configure(with: model)
                return cell

            case .switchCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SwitchTableViewCell.identifier,
                    for: indexPath
                ) as? SwitchTableViewCell else  {
                    return UITableViewCell()
                }
                cell.configure(with: model)
                return cell

            case .addLabelCell(model: let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: AdditionalLabelTableViewCell.identifier,
                    for: indexPath
                ) as? AdditionalLabelTableViewCell else  {
                    return UITableViewCell()
                }
                cell.configure(with: model)
                return cell
            case .notificationCell(model: let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NotificationTableViewCell.identifier,
                    for: indexPath
                ) as? NotificationTableViewCell else  {
                    return UITableViewCell()
                }
                cell.configure(with: model)
                return cell
            }
    }

    



}

