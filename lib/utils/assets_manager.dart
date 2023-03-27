class AssetsManager {
  AssetsManager._();

  // Main Folders
  static const _assetsFolder = 'assets';
  static const _imagesFolder = '$_assetsFolder/images';
  static const _lottieFolder = '$_assetsFolder/lottie';

  // Sub Folders
  static const _appLogoFolder = '$_imagesFolder/app_logo';

  // Images
  static const desktopBackground = '$_imagesFolder/desktop_background.jpg';

  // SVGs
  static const appLogoColored = '$_appLogoFolder/app_logo_colored.png';
  static const appLogoWhite = '$_appLogoFolder/app_logo_white.png';

  // Lottie
  static const filesProcessing = '$_lottieFolder/files_processing.json';
}
