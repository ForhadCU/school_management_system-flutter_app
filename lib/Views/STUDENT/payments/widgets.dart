class PaymentsWidgets {
  // make this class singleton 
    PaymentsWidgets._internal();
    static final PaymentsWidgets _singleton = PaymentsWidgets._internal();
    factory PaymentsWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}