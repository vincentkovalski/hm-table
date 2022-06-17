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
                print("Нажата ячейка Авиарежим")
                    }, isOn: false)),
            SettingsOptionType.addLabelCell(model: SettingsAdditionalLabelOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, addLabelText: "Не подключено", handler: {
                print("Нажата ячейка Wi-Fi")
            })),
            SettingsOptionType.addLabelCell(model: SettingsAdditionalLabelOption(title: "Bluetooth", icon: UIImage(systemName: "dot.radiowaves.right"), iconBackgroundColor: .systemBlue, addLabelText: "Вкл.", handler: {
                print("Нажата ячейка Bluetooth")
            })),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                print("Нажата ячейка Сотовая связь")
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen) {
                    }),
            SettingsOptionType.switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named: "icons8-vpn-status-bar-icon-50")?.withTintColor(UIColor.white), iconBackgroundColor: .systemBlue, handler: {
                print("Нажата ячейка VPN")
                    }, isOn: false))
        ]))
        )


        models.append((Section(options: [
            SettingsOptionType.staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(named: "icons8-notification-center-100")?.withTintColor(UIColor.white), iconBackgroundColor: .systemRed) {
                print("Нажата ячейка Уведомления")
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemRed) {
                print("Нажата ячейка Звуки, тактильные сигналы")
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon"), iconBackgroundColor: .systemIndigo) {
                print("Нажата ячейка Не беспокоить")
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo) {
                print("Нажата ячейка Экранное время")
            }),
        ]))
        )

        models.append((Section(options: [
            SettingsOptionType.notificationCell(model: SettingsNotificationOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray, addLabelText: "1", handler: {
                print("Нажата ячейка Основные")
            }, labelContainerBackgroundColor: .systemRed)
                                               ),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray) {
                print("Нажата ячейка Пункт управления")
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Экран и яркость")
                    }),
            SettingsOptionType.staticCell(model: SettingsOption(title: "Экран \"Домой\"", icon: UIImage(systemName: "square.grid.3x3.fill.square"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Экран \"Домой\"")
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        // обработчик нажатия?
        case .addLabelCell(model: let model):
            model.handler()
        case .notificationCell(model: let model):
            model.handler()
        }
    }
    



}

