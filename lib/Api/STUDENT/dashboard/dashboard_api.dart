class DashboardApis{
  // make this class singleton 
    DashboardApis._internal();
    static final DashboardApis _singleton = DashboardApis._internal();
    factory DashboardApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
