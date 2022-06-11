//
//  ViewController.swift
//  hm-table
//
//  Created by Виктор Ковалевский on 11.06.2022.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)

}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return table
    }()

    var models = [SettingsOption]()



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
        self.models.append(
            // зачем контент of
            contentsOf: [
                (SettingsOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Wi-fi", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Режим модема", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "VPN", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Уведомления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Экранное время", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Основные", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),
                (SettingsOption(title: "Экран Домой", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            print("Вы нажали на авиарежим")
                })),

                           ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        return cell
    }




}

