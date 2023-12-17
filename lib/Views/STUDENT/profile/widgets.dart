class ProfileWidgets {
  // make this class singleton 
    ProfileWidgets._internal();
    static final ProfileWidgets _singleton = ProfileWidgets._internal();
    factory ProfileWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}