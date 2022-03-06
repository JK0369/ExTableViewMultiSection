//
//  SettingSection.swift
//  ExSetting
//
//  Created by 김종권 on 2022/03/06.
//

import UIKit

enum SettingSection {
  case profile([ProfileModel])
  case option([OptionModel])
  case title([TitleModel])
}

struct ProfileModel {
  let profileImage: UIImage?
  let titleText: String?
  let descriptionText: String?
}

struct OptionModel {
  let iconImage: UIImage?
  let title: String?
}

struct TitleModel {
  let title: String?
}
