class AssetsManager {
  AssetsManager._();

  // Main Folders
  static const _assetsFolder = 'assets';
  static const _imagesFolder = '$_assetsFolder/images';
  static const _svgsFolder = 'svgs';
  static const _lottieFolder = '$_assetsFolder/lottie';

  // Sub Folders
  static const _appLogoFolder = '$_svgsFolder/app_logo';

  // Images
  static const desktopBackground = '$_imagesFolder/desktop_background.jpg';

  // SVGs
  static const appLogoColored = '$_appLogoFolder/app_logo_colored.svg';
  static const appLogoWhite = '$_appLogoFolder/app_logo_white.svg';

  // Lottie
  static const filesProcessing = '$_lottieFolder/files_processing.json';
}
