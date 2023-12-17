class PaymentsApi{
  // make this class singleton 
    PaymentsApi._internal();
    static final PaymentsApi _singleton = PaymentsApi._internal();
    factory PaymentsApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
