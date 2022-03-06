//
//  ProfileCell.swift
//  ExSetting
//
//  Created by 김종권 on 2022/03/06.
//

import UIKit
import Then
import SnapKit

final class ProfileCell: UITableViewCell {
  static let id = "ProfileCell"
  
  // MARK: Top
  private let topContainerView = UIView()
  private let profileImageView = UIImageView()
  private let textStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 8.0
  }
  private let titleLabel = UILabel().then {
    $0.textColor = .label
    $0.font = .systemFont(ofSize: 16, weight: .bold)
  }
  private let descLabel = UILabel().then {
    $0.textColor = .secondaryLabel
    $0.font = .systemFont(ofSize: 14)
  }
  private let lineView = UIView().then {
    $0.backgroundColor = .systemGray
  }
  // MARK: Bottom
  private let bottomContainerView = UIView()
  private let bottomLabel = UILabel().then {
    $0.textColor = .label
    $0.font = .systemFont(ofSize: 14)
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    
    self.setupTopLayout()
    self.setupBottomLayout()
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(profileImage: nil, titleText: nil, supplementText: nil)
  }

  private func setupTopLayout() {
    self.contentView.addSubview(self.topContainerView)
    [self.profileImageView,
     self.textStackView,
     self.lineView]
      .forEach { [weak self] in self?.contentView.addSubview($0) }
    [self.titleLabel,
     self.descLabel]
      .forEach { [weak self] in self?.textStackView.addArrangedSubview($0) }
    
    self.profileImageView.snp.makeConstraints {
      $0.top.bottom.left.equalToSuperview()
      $0.size.equalTo(70).priority(999)
    }
    self.textStackView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.left.equalTo(self.profileImageView.snp.right).offset(8)
    }
    self.lineView.snp.makeConstraints {
      $0.right.bottom.equalToSuperview()
      $0.left.equalTo(self.profileImageView.snp.right)
      $0.height.equalTo(1)
    }
  }
  private func setupBottomLayout() {
    self.contentView.addSubview(self.bottomContainerView)
    [self.bottomLabel]
      .forEach { [weak self] in self?.contentView.addSubview($0) }
    
    self.bottomContainerView.snp.makeConstraints {
      $0.top.equalTo(self.topContainerView.snp.bottom)
    }
    self.bottomLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.left.equalToSuperview().inset(16)
    }
  }
  func prepare(profileImage: UIImage?, titleText: String?, supplementText: String?) {
    self.profileImageView.image = profileImage
    self.titleLabel.text = titleText
    self.descLabel.text = supplementText
  }
}
