part of stripe;


/**
 * [Charges](https://stripe.com/docs/api/curl#charges)
 */
class Charge extends Resource {

  String get id => _dataMap["id"];

  String objectName = "charge";

  static String _path = "charges";

  bool get livemode => _dataMap["livemode"];

  int get amount => _dataMap["amount"];

  bool get captured => _dataMap["captured"];

  Card get card {
    var value = _dataMap["card"];
    if (value == null) return null;
    else return new Card.fromMap(value);
  }

  DateTime get created => _getDateTimeFromMap("created");

  String get currency => _dataMap["currency"];

  bool get paid => _dataMap["paid"];

  bool get refunded => _dataMap["refunded"];

  List<Refund> get refunds {
    List refundMaps = _dataMap["refunds"];
    assert(refundMaps != null);
    return refundMaps.map((Map refund) => new Refund.fromMap(refund)).toList(growable: false);
  }

  int get amountRefunded => _dataMap["amountRefunded"];

  String get balanceTransaction {
    var value = _dataMap["balance_transaction"];
    if (value == null) return null;
    else if(value is String) return _dataMap["balance_transaction"];
    else return new Balance.fromMap(value).id;
  }

  Balance get balanceTransactionExpand {
    var value = _dataMap["balance_transaction"];
    if (value == null) return null;
    else return new Balance.fromMap(value);
  }

  String get customer {
    var value = _dataMap["customer"];
    if (value == null) return null;
    else if(value is String) return value;
    else return new Customer.fromMap(value).id;
  }

  Customer get customerExpand {
    var value = _dataMap["customer"];
    if (value == null) return null;
    else return new Customer.fromMap(value);
  }

  String get description => _dataMap["description"];

  Dispute get dispute {
    var value = _dataMap["dispute"];
    if (value == null) return null;
    else return new Dispute.fromMap(value);
  }

  String get failureCode => _dataMap["failureCode"];

  String get failureMessage => _dataMap["failureMessage"];

  String get invoice {
    var value = _dataMap["invoice"];
    if (value == null) return null;
    else if(value is String) return _dataMap["invoice"];
    else return new Invoice.fromMap(value).id;
  }

  Invoice get invoiceExpand {
    var value = _dataMap["invoice"];
    if (value == null) return null;
    else return new Invoice.fromMap(value);
  }

  Map<String, String> get metadata => _dataMap["metadata"];

  String get statement_description => _dataMap["statement_description"];

  Charge.fromMap(Map dataMap) : super.fromMap(dataMap);

  /**
   * [Retrieving a Charge](https://stripe.com/docs/api/curl#retrieve_charge)
   */
  static Future<Charge> retrieve(String id, {final Map data}) {
    return StripeService.retrieve([Charge._path, id], data: data)
        .then((Map json) => new Charge.fromMap(json));
  }

  /**
   * [Refunding a Charge](https://stripe.com/docs/api/curl#refund_charge)
   */
  static Future<Charge> refund(String id, {int amount, bool refundApplicationFee}) {
    Map data = {};
    if (amount != null) data["amount"] = amount;
    if (refundApplicationFee != null) data["refund_application_fee"] = refundApplicationFee;
    if (data == {}) data = null;
    return StripeService.post([Charge._path, id, "refund"], data: data)
        .then((Map json) => new Charge.fromMap(json));
  }

  /**
   * [Capture a charge](https://stripe.com/docs/api/curl#charge_capture)
   */
  static Future<Charge> capture(String id, {int amount, bool refundApplicationFee}) {
    Map data = {};
    if (amount != null) data["amount"] = amount;
    if (refundApplicationFee != null) data["refund_application_fee"] = refundApplicationFee;
    if (data == {}) data = null;
    return StripeService.post([Charge._path, id, "capture"], data: data)
        .then((Map json) => new Charge.fromMap(json));
  }

  /**
   * [List all Charges](https://stripe.com/docs/api/curl#list_charges)
   */
  static Future<ChargeCollection> list({String created, String customer, int limit, String startingAfter, String endingBefore}) {
    Map data = {};
    if (created != null) data["created"] = created;
    if (customer != null) data["customer"] = customer;
    if (limit != null) data["limit"] = limit;
    if (startingAfter != null) data["starting_after"] = startingAfter;
    if (endingBefore != null) data["ending_before"] = endingBefore;
    if (data == {}) data = null;
    return StripeService.list([Charge._path], data: data)
        .then((Map json) => new ChargeCollection.fromMap(json));
  }

}


/**
 * [Creating a new charge (charging a credit card)](https://stripe.com/docs/api/curl#create_charge)
 */
class ChargeCreation extends ResourceRequest {

  @required
  set amount (int amount) => _setMap("amount", amount);

  @required
  set currency (String currency) => _setMap("currency", currency);

  set customer (String customer) => _setMap("customer", customer);

  set cardId (String cardId) => _setMap("card", cardId);

  set cardToken (String cardToken) => _setMap("card", cardToken);

  set card (CardCreation card) => _setMap("card", card._getMap());

  set description (String description) => _setMap("description", description);

  set metadata (Map metadata) => _setMap("metadata", metadata);

  set capture (bool capture) => _setMap("capture", capture.toString());

  set statementDescription (String statementDescription) => _setMap("statement_description", statementDescription);

  set applicationFee (int applicationFee) => _setMap("application_fee", applicationFee);

  Future<Charge> create() {
    return StripeService.create([Charge._path], _getMap())
      .then((Map json) => new Charge.fromMap(json));
  }

}


/**
 * [Updating a Charge](https://stripe.com/docs/api/curl#update_charge)
 */
class ChargeUpdate extends ResourceRequest {

  set description (String description) => _setMap("description", description);

  set metadata (Map metadata) => _setMap("metadata", metadata);

  Future<Charge> update(String id) {
    return StripeService.update([Charge._path, id], _getMap())
      .then((Map json) => new Charge.fromMap(json));
  }

}