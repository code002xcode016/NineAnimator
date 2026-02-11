import Foundation
import UIKit

// Enhanced Theme struct with iOS 15+ support including "Liquid Glass" effects
struct ModernTheme {
    let name: String
    
    let primaryText: UIColor
    let secondaryText: UIColor
    let background: UIColor
    let secondaryBackground: UIColor
    let translucentBackground: UIColor
    let tint: UIColor
    let separator: UIColor
    let blurStyle: UIBlurEffect.Style
    let barStyle: UIBarStyle
    let backgroundBlurStyle: UIBlurEffect.Style
    let scrollIndicatorStyle: UIScrollView.IndicatorStyle
    let activityIndicatorStyle: UIActivityIndicatorView.Style
    let keyboardAppearance: UIKeyboardAppearance
    let preferredStatusBarStyle: UIStatusBarStyle
    
    // iOS 15+ specific properties for "Liquid Glass" effects
    let systemMaterialBackground: UIColor
    let systemGroupedBackground: UIColor
    let systemChromeMaterialBackground: UIColor
    let systemUltraThinMaterialBackground: UIColor
    let systemThickMaterialBackground: UIColor
    
    // iOS 16+ specific properties
    let systemFill: UIColor
    let systemTeal: UIColor
    let systemIndigo: UIColor
}

// MARK: - Creating iOS 15+ Compatible Themes
extension ModernTheme {
    static func createModernThemes() -> [String: ModernTheme] {
        let lightActivityIndicatorStyle: UIActivityIndicatorView.Style
        let darkActivityIndicatorStyle: UIActivityIndicatorView.Style
        
        if #available(iOS 13.0, *) {
            lightActivityIndicatorStyle = .medium
            darkActivityIndicatorStyle = .medium
        } else {
            lightActivityIndicatorStyle = .gray
            darkActivityIndicatorStyle = .white
        }
        
        // Enhanced light theme with iOS 15+ system colors and "Liquid Glass" effects
        let light = ModernTheme(
            name: "light",
            primaryText: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .label : .label
                } else {
                    return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
                }
            },
            secondaryText: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .secondaryLabel : .secondaryLabel
                } else {
                    return UIColor(red: 0.6352941176, green: 0.6352941176, blue: 0.6549019608, alpha: 1)
                }
            },
            background: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemBackground : .systemBackground
                } else {
                    return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            },
            secondaryBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .secondarySystemBackground : .secondarySystemBackground
                } else {
                    return UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                }
            },
            translucentBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemBackground : .systemBackground
                } else {
                    return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            },
            tint: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemBlue : .systemBlue
                } else {
                    return UIColor(red: 0.07843137255, green: 0.5568627451, blue: 1, alpha: 1)
                }
            },
            separator: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .separator : .separator
                } else {
                    return UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
                }
            },
            blurStyle: {
                if #available(iOS 13.0, *) {
                    return .systemUltraThinMaterial
                } else {
                    return .extraLight
                }
            }(),
            barStyle: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .default
                }
            }(),
            backgroundBlurStyle: {
                if #available(iOS 13.0, *) {
                    return .systemMaterial
                } else {
                    return .dark
                }
            }(),
            scrollIndicatorStyle: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .black
                }
            }(),
            activityIndicatorStyle: lightActivityIndicatorStyle,
            keyboardAppearance: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .light
                }
            }(),
            preferredStatusBarStyle: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .default
                }
            }(),
            systemMaterialBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemMaterial : .systemMaterial
                } else {
                    return UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                }
            },
            systemGroupedBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemGroupedBackground : .systemGroupedBackground
                } else {
                    return UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                }
            },
            systemChromeMaterialBackground: UIColor { traitCollection in
                if #available(iOS 15.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemChromeMaterial : .systemChromeMaterial
                } else {
                    return UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                }
            },
            systemUltraThinMaterialBackground: UIColor { traitCollection in
                if #available(iOS 15.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemUltraThinMaterial : .systemUltraThinMaterial
                } else {
                    return UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                }
            },
            systemThickMaterialBackground: UIColor { traitCollection in
                if #available(iOS 15.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemThickMaterial : .systemThickMaterial
                } else {
                    return UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                }
            },
            systemFill: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemFill : .systemFill
                } else {
                    return UIColor(red: 0.4705882353, green: 0.4705882353, blue: 0.5019607843, alpha: 0.24)
                }
            },
            systemTeal: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemTeal : .systemTeal
                } else {
                    return UIColor(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1.0)
                }
            },
            systemIndigo: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemIndigo : .systemIndigo
                } else {
                    return UIColor(red: 0.5294117647, green: 0.3960784314, blue: 0.9607843137, alpha: 1.0)
                }
            }
        )
        
        // Enhanced dark theme with iOS 15+ system colors and "Liquid Glass" effects
        let dark = ModernTheme(
            name: "dark",
            primaryText: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .label : .label
                } else {
                    return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            },
            secondaryText: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .secondaryLabel : .secondaryLabel
                } else {
                    return UIColor(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
                }
            },
            background: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemBackground : .systemBackground
                } else {
                    return UIColor(red: 0.1600990295, green: 0.1600990295, blue: 0.1600990295, alpha: 1)
                }
            },
            secondaryBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .secondarySystemBackground : .secondarySystemBackground
                } else {
                    return UIColor(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
                }
            },
            translucentBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemBackground : .systemBackground
                } else {
                    return UIColor(red: 0.093, green: 0.093, blue: 0.093, alpha: 1)
                }
            },
            tint: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemPurple : .systemPurple
                } else {
                    return UIColor(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                }
            },
            separator: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .separator : .separator
                } else {
                    return UIColor(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                }
            },
            blurStyle: {
                if #available(iOS 13.0, *) {
                    return .systemChromeMaterial
                } else {
                    return .dark
                }
            }(),
            barStyle: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .black
                }
            }(),
            backgroundBlurStyle: {
                if #available(iOS 13.0, *) {
                    return .systemMaterial
                } else {
                    return .regular
                }
            }(),
            scrollIndicatorStyle: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .white
                }
            }(),
            activityIndicatorStyle: darkActivityIndicatorStyle,
            keyboardAppearance: {
                if #available(iOS 13.0, *) {
                    return .dark
                } else {
                    return .dark
                }
            }(),
            preferredStatusBarStyle: {
                if #available(iOS 13.0, *) {
                    return .default
                } else {
                    return .lightContent
                }
            }(),
            systemMaterialBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemMaterial : .systemMaterial
                } else {
                    return UIColor(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
                }
            },
            systemGroupedBackground: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemGroupedBackground : .systemGroupedBackground
                } else {
                    return UIColor(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
                }
            },
            systemChromeMaterialBackground: UIColor { traitCollection in
                if #available(iOS 15.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemChromeMaterial : .systemChromeMaterial
                } else {
                    return UIColor(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
                }
            },
            systemUltraThinMaterialBackground: UIColor { traitCollection in
                if #available(iOS 15.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemUltraThinMaterial : .systemUltraThinMaterial
                } else {
                    return UIColor(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
                }
            },
            systemThickMaterialBackground: UIColor { traitCollection in
                if #available(iOS 15.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemThickMaterial : .systemThickMaterial
                } else {
                    return UIColor(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
                }
            },
            systemFill: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemFill : .systemFill
                } else {
                    return UIColor(red: 0.4705882353, green: 0.4705882353, blue: 0.5019607843, alpha: 0.24)
                }
            },
            systemTeal: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemTeal : .systemTeal
                } else {
                    return UIColor(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1.0)
                }
            },
            systemIndigo: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .systemIndigo : .systemIndigo
                } else {
                    return UIColor(red: 0.5294117647, green: 0.3960784314, blue: 0.9607843137, alpha: 1.0)
                }
            }
        )
        
        return [light.name: light, dark.name: dark]
    }
}

// MARK: - Theme Manager for iOS 15+ Features
class ModernThemeManager {
    static let shared = ModernThemeManager()
    
    private(set) var current: ModernTheme
    
    private init() {
        // Initialize with the first available theme
        let themes = ModernTheme.createModernThemes()
        self.current = themes["light"] ?? themes.first!.value
    }
    
    func setTheme(named name: String) {
        let themes = ModernTheme.createModernThemes()
        if let theme = themes[name] {
            self.current = theme
        }
    }
    
    /// Apply theme to a view controller with iOS 15+ features
    func applyTheme(to viewController: UIViewController) {
        // Apply navigation bar theme with iOS 15+ features
        if let navController = viewController.navigationController {
            if #available(iOS 15.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = current.background
                appearance.titleTextAttributes = [.foregroundColor: current.primaryText]
                appearance.largeTitleTextAttributes = [.foregroundColor: current.primaryText]
                
                navController.navigationBar.standardAppearance = appearance
                navController.navigationBar.scrollEdgeAppearance = appearance
                navController.navigationBar.compactAppearance = appearance
            } else {
                navController.navigationBar.barStyle = current.barStyle
                navController.navigationBar.backgroundColor = current.background
                navController.navigationBar.tintColor = current.tint
            }
        }
        
        // Apply tab bar theme with iOS 15+ features
        if let tabController = viewController.tabBarController {
            if #available(iOS 15.0, *) {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithOpaqueBackground()
                tabBarAppearance.backgroundColor = current.background
                
                tabController.tabBar.standardAppearance = tabBarAppearance
                if #available(iOS 16.0, *) {
                    tabController.tabBar.scrollEdgeAppearance = tabBarAppearance
                }
            } else {
                tabController.tabBar.barStyle = current.barStyle
                tabController.tabBar.backgroundColor = current.background
            }
        }
        
        // Apply "Liquid Glass" effects to the view
        if #available(iOS 15.0, *) {
            applyLiquidGlassEffect(to: viewController.view)
        }
    }
    
    /// Apply "Liquid Glass" effect to a view
    @available(iOS 15.0, *)
    private func applyLiquidGlassEffect(to view: UIView) {
        // Create a visual effect view with the system material
        let materialView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        materialView.translatesAutoresizingMaskIntoConstraints = false
        materialView.layer.cornerCurve = .continuous
        materialView.layer.cornerRadius = 16
        
        // Add to the view and set constraints
        view.addSubview(materialView)
        NSLayoutConstraint.activate([
            materialView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            materialView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            materialView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            materialView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    /// Apply theme to a view with iOS 15+ features
    func applyTheme(to view: UIView) {
        view.backgroundColor = current.background
        
        // Apply specific theming based on view type
        switch view {
        case let tableView as UITableView:
            tableView.backgroundColor = current.background
            tableView.separatorColor = current.separator
            if #available(iOS 15.0, *) {
                tableView.sectionHeaderTopPadding = 0
            }
            
        case let collectionView as UICollectionView:
            collectionView.backgroundColor = current.background
            if #available(iOS 15.0, *) {
                collectionView.overrideUserInterfaceStyle = .unspecified
            }
            
        case let button as UIButton:
            button.backgroundColor = current.tint
            button.setTitleColor(current.translucentBackground, for: .normal)
            if #available(iOS 15.0, *) {
                // Use new iOS 15 button configuration
                var config = UIButton.Configuration.filled()
                config.baseBackgroundColor = current.tint
                config.baseForegroundColor = current.translucentBackground
                button.configuration = config
            }
            
        default:
            view.backgroundColor = current.background
        }
    }
}

// MARK: - Extensions to integrate iOS 15+ theme support
extension UIView {
    /// Apply the current theme with iOS 15+ features
    func applyCurrentTheme() {
        ModernThemeManager.shared.applyTheme(to: self)
    }
    
    /// Apply "Liquid Glass" effect if running iOS 15+
    @available(iOS 15.0, *)
    func applyLiquidGlassEffect() {
        let materialView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        materialView.translatesAutoresizingMaskIntoConstraints = false
        materialView.layer.cornerCurve = .continuous
        materialView.layer.cornerRadius = 16
        
        self.addSubview(materialView)
        NSLayoutConstraint.activate([
            materialView.topAnchor.constraint(equalTo: self.topAnchor),
            materialView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            materialView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            materialView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension UIViewController {
    /// Apply the current theme with iOS 15+ features
    func applyCurrentTheme() {
        ModernThemeManager.shared.applyTheme(to: self)
    }
}