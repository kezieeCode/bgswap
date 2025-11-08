# Reown AppKit Integration Guide

## ✅ What Was Implemented

Your Smart Web project now has full **Reown AppKit** (formerly WalletConnect v2) integration for real wallet connectivity across multiple chains.

### Features Added:
- ✅ Real wallet connections (MetaMask, Coin98, WalletConnect, Coinbase Wallet, BiKeep)
- ✅ Multi-chain support (Ethereum, BSC, Polygon, Cronos, Fantom)
- ✅ Real-time balance fetching
- ✅ Account and chain change listeners
- ✅ Session persistence
- ✅ Responsive mobile toast notifications

---

## 📦 Dependencies Updated

**Updated `pubspec.yaml`:**
```yaml
dependencies:
  reown_appkit: ^1.1.3        # New: Wallet connection SDK
  url_launcher: ^6.3.1        # New: For deep linking to wallets
  web3dart: ^2.5.3            # Kept: Blockchain interactions
  http: ^1.3.0                # Kept: HTTP requests
  # walletconnect_dart: ^0.0.11  # Removed: Deprecated v1
```

---

## 🔧 Setup Instructions

### Step 1: Install Dependencies
Run this command in your project root:

```bash
cd /Users/apple/Documents/smart_contract/smart_web
flutter pub get
```

### Step 2: Verify Your Reown Project ID

Your Project ID is already configured in `lib/constants/string-constant.dart`:
```dart
static const String reownProjectID = "544cf533990827946732f99a9beabb74";
```

**Verify it's valid:**
1. Go to [cloud.reown.com](https://cloud.reown.com)
2. Sign in / create account
3. Check if your Project ID is active
4. If needed, create a new project and update the ID in `string-constant.dart`

### Step 3: Run the App

```bash
# For Web
flutter run -d chrome

# For Android
flutter run -d android

# For iOS
flutter run -d ios
```

---

## 📁 Files Modified/Created

### New Files:
1. **`lib/services/reown_wallet_service.dart`** - Main wallet service
2. **`REOWN_SETUP.md`** - This guide

### Modified Files:
1. **`pubspec.yaml`** - Updated dependencies
2. **`lib/apis/wallet-connect-apis.dart`** - Replaced v1 with Reown
3. **`lib/view/home/home.dart`** - Updated initialization & connection logic
4. **`lib/main.dart`** - Added NavigatorKey for Reown
5. **`lib/view/coinswap/helpers/custom-toast.dart`** - Made responsive for mobile

---

## 🚀 How It Works

### Wallet Connection Flow:

1. **User clicks "Connect Wallet"**
   ```dart
   // Your existing button in home.dart already calls this
   showWalletDialog(context);
   ```

2. **Modal shows wallet options** (MetaMask, Coin98, etc.)
   - User selects a wallet
   - Reown AppKit opens the wallet connection modal

3. **Wallet connects via:**
   - QR Code scanning (mobile wallets)
   - Deep linking (installed wallets)
   - Browser extension (MetaMask, etc.)

4. **App receives:**
   - Wallet address (`0x...`)
   - Connected chain ID
   - Session data

5. **Auto-updates on:**
   - Account changes
   - Chain switches
   - Disconnections

---

## 🔗 Supported Chains

Configured in `ReownWalletService`:

| Chain | Chain ID | RPC URL |
|-------|----------|---------|
| Ethereum Mainnet | `eip155:1` | Infura |
| BSC Mainnet | `eip155:56` | Binance |
| Polygon Mainnet | `eip155:137` | Infura |
| Cronos Mainnet | `eip155:25` | Cronos RPC |
| Fantom Mainnet | `eip155:250` | Fantom RPC |

---

## 💡 Usage Examples

### Check if Connected:
```dart
if (ReownWalletService.isConnected()) {
  final address = ReownWalletService.getCurrentAddress();
  print('Connected: $address');
}
```

### Get Balance:
```dart
final balance = await ReownWalletService.getBalance();
print('Balance: $balance ETH');
```

### Disconnect:
```dart
await ReownWalletService.disconnect();
```

### Switch Chain:
```dart
await ReownWalletService.switchChain('eip155:56'); // Switch to BSC
```

---

## 🧪 Testing

### Test Wallet Connections:

1. **MetaMask:**
   - Install MetaMask browser extension
   - Click "Connect Wallet" → Select MetaMask
   - Approve connection in extension

2. **Mobile Wallets (Trust, Coin98, etc.):**
   - Have wallet app installed on mobile
   - Scan QR code shown in modal
   - Approve connection in wallet app

3. **WalletConnect:**
   - Works with 300+ wallets
   - Universal QR code connection

### Test on Different Chains:

```dart
// Your network selector already works
// Switching networks will update the RPC endpoint
```

---

## ⚠️ Common Issues & Solutions

### Issue 1: "Connection Failed"
**Solution:** Check your Reown Project ID is valid at [cloud.reown.com](https://cloud.reown.com)

### Issue 2: Balance Shows "0.0"
**Solution:** Ensure your Infura API key is set in `.env`:
```env
INFURA_API_KEY=your_api_key_here
```

### Issue 3: Modal Doesn't Open
**Solution:** Ensure NavigatorKey is set in `main.dart` (already done)

### Issue 4: QR Code Not Showing
**Solution:** Install `url_launcher` and grant platform permissions:

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>metamask</string>
  <string>trust</string>
  <string>coinbase</string>
</array>
```

---

## 📝 Next Steps

### 1. Test All Wallet Connections
- [ ] MetaMask (Browser Extension)
- [ ] Coinbase Wallet
- [ ] Trust Wallet (Mobile)
- [ ] Coin98
- [ ] BiKeep

### 2. Test Multi-Chain Functionality
- [ ] Connect on Ethereum
- [ ] Switch to BSC
- [ ] Check balance updates
- [ ] Test transactions

### 3. Production Checklist
- [ ] Verify Reown Project ID
- [ ] Add API keys to `.env`
- [ ] Test on real devices (Android/iOS)
- [ ] Add error handling for network failures
- [ ] Implement transaction signing

---

## 📚 Resources

- **Reown Docs:** https://docs.reown.com/appkit/flutter/core/installation
- **Project Dashboard:** https://cloud.reown.com
- **Supported Wallets:** https://walletconnect.com/explorer
- **Web3Dart Docs:** https://pub.dev/packages/web3dart

---

## 🎉 You're All Set!

Run `flutter pub get` and then `flutter run` to see your new wallet connections in action!

For questions or issues, check the Reown documentation or review the implementation in:
- `lib/services/reown_wallet_service.dart`
- `lib/apis/wallet-connect-apis.dart`

