# 🐛 Debug Guide: Wallet Connection White Screen

## Issue: White Screen or Connection Fails

When you select a wallet from Reown modal, you see:
- **White screen** (especially MetaMask)
- **Other wallets refuse to work**

---

## 🔍 What's Happening

The Reown modal is trying to:
1. Open a deep link to the wallet app
2. Wait for the wallet to respond
3. Establish a connection session

The **white screen** usually means:
- Wallet app not installed
- Deep linking not configured
- Project ID issue
- Browser security blocking

---

## ✅ Step-by-Step Fixes

### Fix 1: Check Your Console Output

Run the app with logs:
```bash
flutter run --verbose
```

Look for these messages:
```
🔄 Initializing Reown AppKit...
✅ Reown AppKit initialized successfully
📱 Project ID: 544cf533990827946732f99a9beabb74
📡 Event listeners set up
🔵 Attempting to connect wallet...
📱 Opening Reown modal...
```

If you see errors, note them!

---

### Fix 2: Verify Project ID is Valid

1. Go to [https://cloud.reown.com](https://cloud.reown.com)
2. Sign in
3. Check if project `544cf533990827946732f99a9beabb74` exists
4. **If not**, create new project and update `lib/constants/string-constant.dart`:
   ```dart
   static const String reownProjectID = "YOUR_NEW_PROJECT_ID";
   ```

---

### Fix 3: Install MetaMask on Your Device

**The white screen happens when the wallet app isn't installed!**

#### For iOS:
```
1. Open App Store
2. Search "MetaMask"
3. Install MetaMask
4. Open it and create/import wallet
5. Try connection again
```

#### For Android:
```
1. Open Google Play Store
2. Search "MetaMask"
3. Install MetaMask
4. Open it and create/import wallet
5. Try connection again
```

#### For Web (Chrome/Brave):
```
1. Go to: https://metamask.io/download
2. Install browser extension
3. Create/import wallet
4. Try connection again
```

---

### Fix 4: Platform Configuration (Critical!)

#### iOS Configuration:

Edit `ios/Runner/Info.plist` - add THIS EXACT CODE:

```xml
<!-- Add before </dict> -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>com.smartweb.app</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>smartweb</string>
        </array>
    </dict>
</array>

<key>LSApplicationQueriesSchemes</key>
<array>
    <string>metamask</string>
    <string>trust</string>
    <string>rainbow</string>
    <string>coinbase</string>
</array>
```

Then rebuild:
```bash
cd ios
pod install
cd ..
flutter clean
flutter run
```

#### Android Configuration:

Edit `android/app/src/main/AndroidManifest.xml`:

Inside the `<activity android:name=".MainActivity">` tag, add:

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data
        android:scheme="smartweb"
        android:host="wc" />
</intent-filter>
```

Before `</manifest>`, add:

```xml
<queries>
    <package android:name="io.metamask" />
    <package android:name="com.wallet.crypto.trustapp" />
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="https" />
    </intent>
</queries>
```

Then rebuild:
```bash
flutter clean
flutter build apk
flutter run
```

---

### Fix 5: Test With Different Wallets

Try this order (from easiest to hardest):

1. **Trust Wallet** - Usually most reliable
   - Install from App/Play Store
   - Try connecting

2. **Rainbow** - Good for testing
   - Install from App/Play Store
   - Try connecting

3. **Coinbase Wallet** - Well supported
   - Install from App/Play Store
   - Try connecting

4. **MetaMask** - Most popular but can be tricky
   - Ensure extension installed (web)
   - Ensure app installed (mobile)

---

### Fix 6: Web-Specific Fix (If testing on Chrome)

For **web testing**, you need to disable CORS:

#### macOS:
```bash
open -na "Google Chrome" --args --user-data-dir="/tmp/chrome_dev" --disable-web-security
```

#### Windows:
```cmd
chrome.exe --user-data-dir="C:\temp\chrome" --disable-web-security
```

#### Linux:
```bash
google-chrome --user-data-dir="/tmp/chrome" --disable-web-security
```

Then run:
```bash
flutter run -d chrome --web-browser-flag="--disable-web-security"
```

---

## 🧪 Testing Flow

### Proper Connection Flow:

1. **Click "Connect Wallet"**
   - Your custom modal appears

2. **Select wallet** (e.g., MetaMask)
   - Console: `🔵 Attempting to connect wallet...`
   - Console: `📱 Opening Reown modal...`

3. **Reown modal appears**
   - Shows QR code
   - Shows list of wallets
   - Shows "Copy link" option

4. **Click wallet from list**
   - Modal attempts deep link
   - Opens wallet app (if installed)

5. **In Wallet App:**
   - See connection request
   - Approve connection

6. **Back to your app:**
   - Console: `🎉 Modal connected event fired!`
   - Console: `✅ Connected! Address: 0x...`
   - Balance displays
   - Toast appears

---

## 🚨 Common Errors & Solutions

### Error: "White screen after selecting wallet"
**Cause:** Wallet app not installed

**Solution:**
```
1. Install wallet app from store
2. Create/import wallet in app
3. Try again
```

---

### Error: "Nothing happens when I select wallet"
**Cause:** Deep linking not configured

**Solution:**
```
1. Follow Fix 4 above (Platform Configuration)
2. Rebuild app: flutter clean && flutter run
```

---

### Error: "Modal closes immediately"
**Cause:** User cancelled or connection timeout

**Solution:**
```
1. Try again
2. Keep wallet app open in background
3. Approve connection request quickly
```

---

### Error: "Invalid Project ID"
**Console shows:** `❌ Error initializing Reown AppKit`

**Solution:**
```
1. Go to cloud.reown.com
2. Create new project
3. Copy Project ID
4. Update in lib/constants/string-constant.dart
5. Restart app
```

---

## 📱 Testing on Real Device (Recommended)

Simulators often don't support deep linking properly!

### iOS Physical Device:
```bash
flutter devices  # Find your device ID
flutter run -d <your-iphone-id>
```

### Android Physical Device:
```bash
flutter devices  # Find your device ID
flutter run -d <your-android-id>
```

---

## 🔬 Advanced Debugging

### Enable Verbose Logging:

Add to your `main()` in `lib/main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Enable debug logging
  debugPrint('🚀 App starting...');
  
  runApp(const MyApp());
}
```

### Check Reown Dashboard:

1. Go to [https://cloud.reown.com](https://cloud.reown.com)
2. Open your project
3. Click "Analytics"
4. See connection attempts in real-time

---

## ✅ Checklist Before Testing

- [ ] Valid Project ID from cloud.reown.com
- [ ] Wallet app installed on device
- [ ] Wallet has account created
- [ ] iOS: Info.plist configured with deep linking
- [ ] Android: AndroidManifest.xml configured with intents
- [ ] Testing on **real device** (not simulator)
- [ ] App rebuilt after config changes: `flutter clean && flutter run`
- [ ] Console open to see logs

---

## 🎯 Expected Console Output

When everything works, you should see:

```
🔄 Initializing Reown AppKit...
✅ Reown AppKit initialized successfully
📱 Project ID: 544cf533990827946732f99a9beabb74
📡 Event listeners set up
🔵 Attempting to connect wallet...
📱 Opening Reown modal...
🔄 Opening wallet selection modal...
[User selects wallet and approves in app]
🎉 Modal connected event fired!
   Address: 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb
✅ Connected! Address: 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb
```

---

## 📞 Still Having Issues?

1. **Share console logs** - Copy everything from terminal
2. **Check Project ID** - Verify at cloud.reown.com
3. **Try different wallet** - Trust Wallet is most reliable
4. **Test on real device** - Not simulator

---

## 🔥 Quick Fix Summary

Most common fix:
```bash
# 1. Install MetaMask on your phone/computer
# 2. Configure deep linking (see Fix 4)
# 3. Rebuild
flutter clean
flutter pub get
flutter run

# 4. Try connection again
# 5. Approve in MetaMask app when prompted
```

Good luck! 🚀

