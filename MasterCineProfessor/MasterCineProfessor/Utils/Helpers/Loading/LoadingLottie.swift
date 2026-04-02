//
//  LoadingLottie.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 01/04/26.
//
import UIKit
import Lottie

final class LoadingLottie: UIView {
    private static let shared = LoadingLottie()
    private let animationName = "movieLoading"
    private var loadingCount: Int = 0

    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.isUserInteractionEnabled = false
        return blurView
    }()

    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.backgroundBehavior = .pauseAndRestore
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        isUserInteractionEnabled = true
        backgroundColor = .clear

        addSubviews()
        configConstraints()
    }

    private func addSubviews() {
        addSubview(blurView)
        addSubview(animationView)
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),

            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 180),
            animationView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    static func start(view: UIView? = nil) {
        DispatchQueue.main.async {
            let target = view ?? UIApplication.mc_primaryKeyWindow
            guard let container = target else { return }
            LoadingLottie.shared.incrementAndShow(view: container)
        }
    }

    private func incrementAndShow(view: UIView) {
        loadingCount += 1
        guard superview == nil else { return }
        show(view: view)
    }

    private func show(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0

        animationView.animation = LottieAnimation.named(animationName)

        view.addSubview(self)

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        animationView.play()

        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.alpha = 1
        }
    }

    static func stop() {
        DispatchQueue.main.async {
            LoadingLottie.shared.decrementAndHide()
        }
    }

    private func decrementAndHide() {
        guard loadingCount > 0 else { return }
        loadingCount -= 1

        if loadingCount == 0 {
            hide()
        }
    }

    private func hide() {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.alpha = 0
        }, completion: { [weak self] _ in
            guard let self else { return }
            animationView.stop()
            removeFromSuperview()
        })
    }
}
