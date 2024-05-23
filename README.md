
# SwiftUI OTP

This project contains the implementation of an OTP (One-Time Password) screen using plain SwiftUI.

## Example

Here's a screenshot of the OTP screen in action:

<img src="https://github.com/ShivadityaKr/SwiftUI-OTP/assets/71021935/792f1874-73f7-4138-917a-e8b8df70a374" alt="OTP Screen Example" width="300"/>

## Features

- SwiftUI-based OTP input screen
- Clean and minimal design
- Easy to integrate into any SwiftUI project

## Getting Started

Follow these steps to integrate the OTP screen into your project:

1. **Clone the repository:**

   ```sh
   git clone https://github.com/ShivadityaKr/SwiftUI-OTP.git
   ```

2. **Open the project in Xcode:**

   Navigate to the project directory and open the `.xcodeproj` file with Xcode.

   ```sh
   cd SwiftUI-OTP
   open SwiftUI-OTP.xcodeproj
   ```

3. **Build and run:**

   Select your target device or simulator and press `Cmd + R` to build and run the project.

## Integration

To use the OTP screen in your own SwiftUI project, follow these steps:

1. **Copy the OTP screen files:**

   Copy the necessary files from this project to your own project. These typically include the SwiftUI view and any related files (such as view models or custom components).

2. **Add the OTP screen to your view hierarchy:**

   Add the OTP screen view to your existing view hierarchy where you need the OTP input functionality.

   ```swift
   import SwiftUI

   struct ContentView: View {
       @State var otpText = ""
       var body: some View {
           VStack {
               Image(systemName: "globe")
                   .imageScale(.large)
                   .foregroundStyle(.tint)
               Text("OTP Screen")
               AppOtpView(otpText: $otpText) { value in
                   print(value)
               }
               .padding(.top, 10)
           }
           .padding()
       }
   }

   #Preview {
       ContentView()
   }
   ```

3. **Customize as needed:**

   Customize the OTP screen to fit the design and requirements of your application. This may include modifying the appearance, handling different OTP lengths, or integrating with your backend for OTP verification.

## Requirements

- Xcode 12 or later
- iOS 14.0 or later

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact

For any questions or suggestions, feel free to open an issue on the [GitHub repository](https://github.com/ShivadityaKr/SwiftUI-OTP).

---

By ShivadityaKr
