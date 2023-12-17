class ProfileApis{
  // make this class singleton 
    ProfileApis._internal();
    static final ProfileApis _singleton = ProfileApis._internal();
    factory ProfileApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
