/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import UIKit
import YogaKit

final class AddMoreViewController: UIViewController {
    private let button: UIButton = UIButton(type: .system)
    private let contentView: UIView = UIView(frame: .zero)

    override func viewDidLoad() {
        let root = self.view!
        root.backgroundColor = .white
        root.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.justifyContent = .spaceAround
        }

        contentView.backgroundColor = .clear
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = 300
            layout.width = YGValue(self.view.bounds.size.width)
            layout.flexDirection = .row
            layout.justifyContent = .center
            layout.paddingHorizontal = 25
        }
        self.view.addSubview(contentView)

        let redView = UIView(frame: .zero)
        redView.backgroundColor = .red
        redView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
            layout.flexShrink = 1
        }
        contentView.addSubview(redView)

        button.setTitle("Add More View", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: UIControl.Event.touchUpInside)
        button.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = 300
            layout.width = 300
            layout.alignSelf = .center
        }
        root.addSubview(button)

        root.yoga.applyLayout(preservingOrigin: false)
    }

    // MARK - UIButton Action
    @objc func buttonWasTapped() {
        addMoreView()

        contentView.yoga.applyLayout(preservingOrigin: true)
        button.isUserInteractionEnabled = true
    }
    
    func addMoreView() {
        let newView: UIView = UIView(frame: .zero)
        newView.backgroundColor = contentView.subviews.count % 2 == 0 ? .red : .blue
        newView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
        }
        contentView.addSubview(newView)
    }
}
