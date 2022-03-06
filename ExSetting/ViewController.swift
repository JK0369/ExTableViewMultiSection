//
//  ViewController.swift
//  ExSetting
//
//  Created by 김종권 on 2022/03/06.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
  private let settingTableView = UITableView(frame: .zero, style: .insetGrouped).then {
    $0.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.id)
    $0.register(TitleCell.self, forCellReuseIdentifier: TitleCell.id)
    $0.register(OptionCell.self, forCellReuseIdentifier: OptionCell.id)
    $0.separatorStyle = .none
  }
  
  private var dataSource = [SettingSection]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.settingTableView)
    self.settingTableView.dataSource = self
    self.settingTableView.separatorStyle = .none
    self.settingTableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    self.refresh()
  }
  
  private func refresh() {
    // profile
    let profileModel = ProfileModel(
      profileImage: UIImage(named: "person"),
      titleText: "Jake Kim",
      descriptionText: "Apple ID, iCloud, 미디어 및 구입"
    )
    let profileSection = SettingSection.profile([profileModel])
    
    // title
    let titleModel = TitleModel(title: "iPhone 설정 마저 하기")
    let titleSection = SettingSection.title([titleModel])
    
    // option
    let optionModels = [
      OptionModel(iconImage: UIImage(systemName: "pencil"), title: "수정하기"),
      OptionModel(iconImage: UIImage(systemName: "square.and.arrow.up.fill"), title: "공유"),
      OptionModel(iconImage: UIImage(systemName: "paperplane.fill"), title: "네비게이션")
    ]
    let optionSection = SettingSection.option(optionModels)
    
    self.dataSource = [profileSection, titleSection, optionSection]
    self.settingTableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    self.dataSource.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch self.dataSource[section] {
    case let .profile(profileModels):
      return profileModels.count
    case let .title(titleModels):
      return titleModels.count
    case let .option(optionModels):
      return optionModels.count
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch self.dataSource[indexPath.section] {
    case let .profile(profileModels):
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.id, for: indexPath) as! ProfileCell
      let profileModel = profileModels[indexPath.row]
      cell.prepare(
        profileImage: profileModel.profileImage,
        titleText: profileModel.titleText,
        supplementText: profileModel.descriptionText
      )
      return cell
    case let .title(titleModels):
      let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.id, for: indexPath) as! TitleCell
      let titleModel = titleModels[indexPath.row]
      cell.prepare(titleText: titleModel.title)
      return cell
    case let .option(optionModels):
      let cell = tableView.dequeueReusableCell(withIdentifier: OptionCell.id, for: indexPath) as! OptionCell
      let optionModel = optionModels[indexPath.row]
      cell.prepare(
        icon: optionModel.iconImage,
        titleText: optionModel.title
      )
      return cell
    }
  }
}
