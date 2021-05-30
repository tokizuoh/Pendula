//
//  ConvertPictureViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/29.
//

import UIKit

final class ConvertPictureViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }

    /// Center of tableView
    @IBOutlet weak var tableViewCenterPointView: UIView! {
        didSet {
            tableViewCenterPointView.layer.cornerRadius = 25
        }
    }

    @IBOutlet weak var convertButton: UIButton! {
        didSet {
            convertButton.layer.cornerRadius = 4.0
        }
    }

    @IBOutlet weak var convertedImageView: UIImageView! {
        didSet {
            convertedImageView.layer.borderWidth = 1.0
            convertedImageView.layer.borderColor = UIColor.gray.cgColor
        }
    }

    /// Center of imageView
    @IBOutlet weak var imageViewCenterPointView: UIView! {
        didSet {
            imageViewCenterPointView.layer.cornerRadius = 25
        }
    }

    private let items = ["りんご りんご りんご りんご りんご",
                         "バナナ バナナ バナナ バナナ バナナ",
                         "カレー カレー カレー カレー カレー",
                         "ホットケーキ ホットケーキ ホットケーキ ホットケーキ ホットケーキ",
                         "ラベンダー ラベンダー ラベンダー ラベンダー ラベンダー"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "010 ConvertPicture",
                                blogURL: URL(string: "https://tokizuoh.dev/posts/g62b0grtisx7b8n7/"),
                                githubPRURL: nil)
    }

    @IBAction func convert(_ sender: Any) {
        let image = convertUIViewToUIImage(from: tableView)
        convertedImageView.contentMode = .center
        convertedImageView.image = rotate(from: image)
    }

}

// MARK: - Convert UIView to Picture
extension ConvertPictureViewController {

    private func convertUIViewToUIImage(from: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: from.bounds.size)
        let image = renderer.image { context in
            from.layer.render(in: context.cgContext)
        }
        return image
    }

}

// MARK: - Rotate UIImage
extension ConvertPictureViewController {

    private func rotate(from: UIImage, angle: CGFloat = CGFloat.random(in: 0...360)) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(from.size, false, UIScreen.main.scale)

        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: from.size.width / 2, y: from.size.height / 2)
        context.scaleBy(x: 1.0, y: -1.0)

        let radian = -angle * CGFloat.pi / 180
        context.rotate(by: radian)

        context.draw(from.cgImage!, in: CGRect(x: -(from.size.width / 2), y: -(from.size.height / 2),
                                               width: from.size.width, height: from.size.height))

        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return rotatedImage
    }

}

extension ConvertPictureViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        cell.detailTextLabel?.text = "\(indexPath.row)"
        return cell
    }

}
