abstract class EndPoints {
  static const String baseUrl =
      'http://graduation-project-version1.runasp.net/';
  static const String register = 'Auth/register';
  static const String login = 'Auth/Login';
  static const String getBabyById = 'Account/ChooseBaby?BabyId=';
  static const String getMotherData = 'Account/GetMotherProfile';
  static const String updateMotherProfile = 'Account/UpdateMotherprofile';
  static const String changePassword = 'Account/Change-Password';
  static const String forgetPassword = 'Auth/Forget-Password';
  static const String resetPassword = 'Reset-Password';
  static const String addBaby = 'Account/AddBaby';
  static const String chooseBaby = 'Account/ChooseBaby?BabyId=';
  static const String updateBabyProfile = 'Account/updateBabyProfile';
  static const String confirmPassword = 'Auth/confirm-email';
  static const String resendConfirmEmail = 'Auth/resend-confirm-email';
  static const String getAllGovernorates = 'Hospital/GetAllGovernorates';
  static const String getAllHospital = 'Hospital/GetAllHospitals';
  static const String filterHospitalById = 'Hospital/GetAllFilteredHospitals/';
  static const String getHospitalById = 'Hospital/GetById/';
  static const String addHospitlaToFav = 'Hospital/AddToFav/';
  static const String getFavoriteHospital = 'Hospital/GetFavouriteHospitals';
  static const String delFavoriteHospital = 'Hospital/DeleteFav/';
  static const String recipes = 'BabyFeatures/Recipes';
  static const String englishActivites = 'BabyFeatures/EnglishActivites';
  static const String arabicActivites = 'BabyFeatures/ArabicActivites';
  static const String englishArticles = 'MotherFeatures/EnglishArticles';
  static const String arabicArticles = 'MotherFeatures/ArabicArticles';
  static const String arabicVideos = 'MotherFeatures/ArabicVideos';
  static const String englishVideos = 'MotherFeatures/EnglishVideos';
  static const String englishPodcasts = 'MotherFeatures/EnglishPodcasts';
  static const String arabicPodcasts = 'MotherFeatures/ArabicPodcasts';
  static const String getMotherProfile = 'Account/GetMotherProfile';
  static const String tipsAndtricks = 'MotherFeatures/TipsAndtricks';
  static const String addGallrey = 'Gallary/Create';
  static const String getGallrey = 'Gallary';
  static const String deleteGallrey = 'Gallary/';
  static const String geminiApi = 'AIzaSyC3sKCiac5uBzqCNW00dSPW0Vm1dfg8O3o';
  static const String shop = 'https://mahdproject.duckdns.org/products/';
  static const String searchArticles = 'MotherFeatures/Articles/Search';
  static const String search = 'Search';
  static const String top4Englishpodcasts = 'MotherFeatures/EnglishPodcasts/Top4';
  static const String top4Arabicpodcasts = 'MotherFeatures/ArabicPodcasts/Top4';
  static const String top4ArabicVideos = 'MotherFeatures/ArabicVideos/Top4';
  static const String top4EnglishVideos = 'MotherFeatures/EnglishVideos/Top4';
  static const String top4EnglishArticles = 'MotherFeatures/EnglishArticles/Top4';
  static const String top4ArabicArticles = 'MotherFeatures/ArabicArticles/Top4';
  static const String searchOnHospitals = 'Hospital/SearchHospitals';
  static const String searchOnGovernorates = 'Hospital/SearchGovernorates';
}

abstract class ApiKey {
  static const email = 'email';
  static const password = 'password';
  static const confirmPassword = 'confirmPassword';
  static const token = 'token';
  static const userData = 'userData';
  static const babyId = 'babyId';
  static const notification = 'reminderNotification';
  static const lang = 'lang';
}
