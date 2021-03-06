# Stripe Dart

[ ![Codeship Status for exitlive/stripe-dart](https://codeship.com/projects/5507d630-62a5-0132-dd06-4e545b297600/status?branch=master)](https://codeship.com/projects/52114)


Stripe API (version 2016-07-06) implemented in dart.

Most of the model class documentations have been taken from the
[stripe documentation](https://stripe.com/docs).

This implementation is based on the official Stripe Java and NodeJS API wrappers
and written as a proper native dart library.


## Usage

```dart
import "package:stripe/stripe.dart";

main() async {

  var cardCreation = new CardCreation()
      ..number = '123123123';

  var customerCreation = new CustomerCreation()
      ..description = 'Customer for test@example.com'
      ..card = card;
      
  var customer = await customerCreation.create();

}
```

## Tests

The majority of the tests rely on connecting to a real Stripe Account in
testmode.
Therefore all tests expect your API **Test** Secret Key as the first script
argument and your account must be set to **US**. Testcoverage is limited (some
tests would require livemode and or OAuth).


## License

Copyright (c) 2014 Matias Meno (m@tias.me), Martin Flucka (martin.flucka@gmail.com)

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

