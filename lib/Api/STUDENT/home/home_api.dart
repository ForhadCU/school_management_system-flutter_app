class HomeApis{
  // make this class singleton 
    HomeApis._internal();
    static final HomeApis _singleton = HomeApis._internal();
    factory HomeApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
