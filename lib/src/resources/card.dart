part of stripe;


/**
 * [Card](https://stripe.com/docs/api/curl#cards)
 */
class Card extends Resource {

  String get id => _dataMap["id"];

  final String objectName = "card";

  static String _path = "cards";

  int get expMonth => _dataMap["exp_month"];

  int get expYear => _dataMap["exp_year"];

  String get fingerprint => _dataMap["fingerprint"];

  String get last4 => _dataMap["last4"];

  String get type => _dataMap["type"];

  String get addressCity => _dataMap["address_city"];

  String get addressCountry => _dataMap["address_country"];

  String get addressLine1 => _dataMap["address_line1"];

  String get addressLine1Check => _dataMap["address_line1_check"];

  String get addressLine2 => _dataMap["address_line2"];

  String get addressState => _dataMap["address_state"];

  String get addressZip => _dataMap["address_zip"];

  String get addressZipCheck => _dataMap["address_zip_check"];

  String get country => _dataMap["country"];

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

  String get cvcCheck => _dataMap["cvc_check"];

  String get name => _dataMap["name"];

  Card.fromMap(Map dataMap) : super.fromMap(dataMap);

  /**
   * [Retrieving a customer's card](https://stripe.com/docs/api/curl#retrieve_card)
   */
  static Future<Card> retrieve(String customerId, String cardId, {final Map data}) {
    return StripeService.retrieve([Customer._path, customerId, Card._path, cardId], data: data)
        .then((Map json) => new Card.fromMap(json));
  }

  /**
   * [Listing cards](https://stripe.com/docs/api/curl#list_cards)
   */
  static Future<CardCollection> list(String customerId, {int limit, String startingAfter, String endingBefore}) {
    Map data = {};
    if (limit != null) data["limit"] = limit;
    if (startingAfter != null) data["starting_after"] = startingAfter;
    if (endingBefore != null) data["ending_before"] = endingBefore;
    if (data == {}) data = null;
    return StripeService.list([Customer._path, customerId, Card._path], data: data)
        .then((Map json) => new CardCollection.fromMap(json));
  }

  /**
   * [Deleting cards](https://stripe.com/docs/api/curl#delete_card)
   */
  static Future delete(String customerId, String cardId) => StripeService.delete([Customer._path, customerId, Card._path, cardId]);

}


/**
 * [Creating a new card](https://stripe.com/docs/api/curl#create_card)
 */
class CardCreation extends ResourceRequest {

  @required
  set number (String number) => _setMap("number", number);

  @required
  set expMonth (int expMonth) => _setMap("exp_month", expMonth);

  @required
  set expYear (int expYear) => _setMap("exp_year", expYear);

  set cvc (int cvc) => _setMap("cvc", cvc);

  set name (String name) => _setMap("name", name);

  set addressLine1 (String addressLine1) => _setMap("address_line1", addressLine1);

  set addressLine2 (String addressLine2) => _setMap("address_line2", addressLine2);

  set addressCity (String addressCity) => _setMap("address_city", addressCity);

  set addressZip (String addressZip) => _setMap("address_zip", addressZip);

  set addressState (String addressState) => _setMap("address_state", addressState);

  set addressCountry (String addressCountry) => _setMap("address_country", addressCountry);

  Future<Card> create(String customerId) {
    return StripeService.create([Customer._path, customerId, Card._path], {"card": _getMap()})
      .then((Map json) => new Card.fromMap(json));
  }

}


/**
 * [Creating a new card](https://stripe.com/docs/api/curl#create_card)
 */
class CardCreationWithToken extends ResourceRequest {

  @required
  set token (String token) => _setMap("card", token);

  Future<Card> create(String customerId) {
    return StripeService.create([Customer._path, customerId, Card._path], _getMap())
      .then((Map json) => new Card.fromMap(json));
  }

}


/**
 * [Updating a card](https://stripe.com/docs/api/curl#update_card)
 */
class CardUpdate extends ResourceRequest {

  set addressCity (String addressCity) => _setMap("address_city", addressCity);

  set addressCountry (String addressCountry) => _setMap("address_country", addressCountry);

  set addressLine1 (String addressLine1) => _setMap("address_line1", addressLine1);

  set addressLine2 (String addressLine2) => _setMap("address_line2", addressLine2);

  set addressState (String addressState) => _setMap("address_state", addressState);

  set addressZip (String addressZip) => _setMap("address_zip", addressZip);

  set expMonth (int expMonth) => _setMap("exp_month", expMonth);

  set expYear (int expYear) => _setMap("exp_year", expYear);

  set name (String name) => _setMap("name", name);

  Future<Card> update(String customerId, String cardId) {
    return StripeService.update([Customer._path, customerId, Card._path, cardId], _getMap())
          .then((Map json) => new Card.fromMap(json));
  }

}
