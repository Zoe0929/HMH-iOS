//
//  TitleCollectionReusableView.swift
//  HMH_iOS
//
//  Created by 지희의 MAC on 1/6/24.
//

import UIKit

import SnapKit
import Then


final class TitleCollectionReusableView: UICollectionReusableView {
    static let identifier = "TitleCollectionReusableView"
    
    private var isCompleted: Bool = true
    var isButtonTapped = false
    
    let button = OnboardingButton(buttonStatus: .enabled)
    private let subTitleLabel = UILabel().then {
        $0.text = StringLiteral.Challenge.Date.dateHeaderSubTitle
        $0.font = .iosText5Medium16
        $0.textColor = .gray1
    }
    
    private let titleLabel = UILabel().then {
        $0.text = StringLiteral.Challenge.Date.dateHeaderTitle
        $0.font = .iosTitle1Semibold32
        $0.textColor = .whiteText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        configureTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        if isCompleted {
            self.addSubviews(titleLabel, button)
        } else {
            self.addSubviews(titleLabel, subTitleLabel)
        }
    }
    
    private func setConstraints() {
        if isCompleted {
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20.adjustedWidth)
                $0.top.equalToSuperview().offset(17.adjusted)
            }
            
            button.snp.makeConstraints {
                $0.width.equalTo(336.adjustedWidth)
                $0.leading.equalToSuperview().offset(20.adjustedWidth)
                $0.bottom.equalToSuperview().offset(12.adjusted)
            }
        } else {
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(29.adjustedWidth)
                $0.bottom.equalToSuperview().inset(26.adjusted)
            }
            
            subTitleLabel.snp.makeConstraints {
                $0.leading.equalTo(titleLabel)
                $0.bottom.equalTo(titleLabel.snp.top).offset(-9.adjusted)
            }
        }
    }
    
    private func configureTitle() {
        if isCompleted{
            titleLabel.setTextWithLineHeightLeft(text: StringLiteral.Challenge.Date.createHeaderTitle, lineHeight: 33)
            titleLabel.font = .iosTitle3Semibold22
            button.setButtonText(buttonTitle: StringLiteral.Challenge.Date.challengeButton)
        }
    }
    
    @objc func deleteButtonDidTapped() {
        if isButtonTapped {
            
        } else {
            
        }
        isButtonTapped.toggle()
    }
}
