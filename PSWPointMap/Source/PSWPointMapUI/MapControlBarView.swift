//
//  MapControllBarView.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit

final class MapControlBarView: UIView {
    
    private enum Constant {
        static let offset: CGFloat = 20
        static let buttonSize: CGFloat = 40
    }
    
    //MARK: - Public properties
    var didTapMoveToCenterAction: (() -> ())?
    var didTapChangeModeAction: (() -> ())?
    
    //MARK: - Private properties
    private let moveToCenterButton = UIButton()
    private let changeModeButton = UIButton()
    
    //MARK: - Initializers
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupButtonsStyle()
        setupButtonsAction()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }

    //MARK: - Private Methods
    @objc
    private func moveToCenterDidTap() {
        didTapMoveToCenterAction?()
    }
    
    @objc
    private func changeModeDidTap() {
        changeModeButton.isSelected.toggle()
        didTapChangeModeAction?()
    }
}

private extension MapControlBarView {
    //MARK: - Private Helpers
    func setupButtonsStyle() {
        moveToCenterButton.backgroundColor = .systemGray6
        moveToCenterButton.setImage(.location, for: .normal)
        moveToCenterButton.setImage(.highlightedLocation, for: .highlighted)
        moveToCenterButton.layer.cornerRadius = Constant.buttonSize/2
        
        changeModeButton.backgroundColor = .systemGray6
        changeModeButton.setImage(.setPointModeIcon, for: .normal)
        changeModeButton.setImage(.focusingModeIcon, for: .selected)
        changeModeButton.layer.cornerRadius = Constant.buttonSize/2
    }
    
    func setupButtonsAction() {
        moveToCenterButton.addTarget(self, action: #selector(moveToCenterDidTap), for: .touchUpInside)
        changeModeButton.addTarget(self, action: #selector(changeModeDidTap), for: .touchUpInside)
    }
}

private extension MapControlBarView {
    //MARK: - Private Layout
    func setupLayout() {
        addSubview(moveToCenterButton) {
            $0.top.leading.equalToSuperview().offset(Constant.offset)
            $0.width.height.equalTo(Constant.buttonSize)
        }
        
        addSubview(changeModeButton) {
            $0.top.equalTo(moveToCenterButton.snp.bottom).offset(Constant.offset)
            $0.leading.width.height.equalTo(moveToCenterButton)
        }
    }
}
