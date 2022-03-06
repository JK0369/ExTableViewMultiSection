//
//  OptionCell.swift
//  ExSetting
//
//  Created by 김종권 on 2022/03/06.
//

import UIKit
import Then
import SnapKit

final class OptionCell: UITableViewCell {
  static let id = "OptionCell"
  
  private let iconImageView = UIImageView()
  private let titleLabel = UILabel().then {
    $0.textColor = .label
    $0.font = .systemFont(ofSize: 14)
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.setupLayout()
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(icon: nil, titleText: nil)
  }
  
  private func setupLayout() {
    self.contentView.addSubview(self.iconImageView)
    self.contentView.addSubview(self.titleLabel)
    self.iconImageView.snp.makeConstraints {
      $0.left.equalToSuperview().inset(16)
      $0.centerY.equalToSuperview()
    }
    self.titleLabel.snp.makeConstraints {
      $0.left.equalTo(self.iconImageView.snp.right).offset(8)
      $0.right.lessThanOrEqualToSuperview().inset(16)
      $0.centerY.equalToSuperview()
    }
  }
  func prepare(icon: UIImage?, titleText: String?) {
    self.iconImageView.image = icon
    self.titleLabel.text = titleText
  }
}

