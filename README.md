# ShakeBottles-iOS
A anonymous socialnetwork App for iOS platform

## How to Build

### 1. Environment
Make sure you have the following tools installed on your macOS
1. Xcode
2. Cocoapods
3. Node.js and npm
4. commitizen by running `npm install -g commitizen`
5. commitlint by running `npm install -g @commitlint/cli @commitlint/config-conventional`

### 2. Build
At first, install all the pod and node libraries by running:
```
pod install
npm -i
```

Then open the `ShakeBottles.xcworkspace` in Xcode and click `⌘+R` to run the project on a specific target device or a simulator.

## Commit Changes
Using `git cz` to commit you changes with conventional standard git commit messages which will be checked by commitlint.
