import Foundation
import UIKit

// Updated theme with iOS 15+ support
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
    
    // iOS 15+ compatible properties
    let systemMaterialBackground: UIColor
    let systemGroupedBackground: UIColor
}

// MARK: - Creating Modern Theme
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
        
        // Enhanced light theme with iOS 15+ system colors
        let light = ModernTheme(
            name: "light",
            primaryText: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .label : .label
                } else {
                    return .black
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
                    return .white
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
                    return .white
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
            }
        )
        
        // Enhanced dark theme with iOS 15+ system colors
        let dark = ModernTheme(
            name: "dark",
            primaryText: UIColor { traitCollection in
                if #available(iOS 13.0, *) {
                    return traitCollection.userInterfaceStyle == .dark ? .label : .label
                } else {
                    return .white
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
            }
        )
        
        return [light.name: light, dark.name: dark]
    }
}