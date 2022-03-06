//
//  OnlyCellModel.swift
//  ExSetting
//
//  Created by 김종권 on 2022/03/06.
//

import UIKit

enum OnlyCellModel {
  case profile(profileImage: UIImage?, titleText: String, descriptionText: String)
  case option(iconImage: UIImage?, title: String)
  case title(title: String)
}
