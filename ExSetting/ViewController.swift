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
  
  private var dataSource = [OnlyCellModel]()
  
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
    self.dataSource = [
      .profile(
        profileImage: UIImage(named: "person"),
        titleText: "Jake Kim",
        descriptionText: "Apple ID, iCloud, 미디어 및 구입"
      ),
      .title(title: "iPhone 설정 마저 하기"),
      .option(iconImage: UIImage(systemName: "pencil.fill"), title: "수정하기"),
      .option(iconImage: UIImage(systemName: "square.and.arrow.up.fill"), title: "공유"),
      .option(iconImage: UIImage(systemName: "paperplane.fill"), title: "네비게이션")
    ]
    self.settingTableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.dataSource.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch self.dataSource[indexPath.row] {
    case let .profile(profileImage, titleText, descriptionText):
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.id, for: indexPath) as! ProfileCell
      cell.prepare(profileImage: profileImage, titleText: titleText, supplementText: descriptionText)
      return cell
    case let .title(title):
      let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.id, for: indexPath) as! TitleCell
      cell.prepare(titleText: title)
      return cell
    case let .option(iconImage, title):
      let cell = tableView.dequeueReusableCell(withIdentifier: OptionCell.id, for: indexPath) as! OptionCell
      cell.prepare(icon: iconImage, titleText: title)
      return cell
    }
  }
}
