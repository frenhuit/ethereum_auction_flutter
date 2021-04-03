import 'package:ethereum_auction/main.dart' as app;
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('create auction', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Create Auction'));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey1);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    expect(find.text(StringAssets.newAuctionItemText), findsOneWidget);
    expect(
        find.text(StringAssets.newAuctionItemDescriptionText), findsOneWidget);
    expect(find.text(StringAssets.newAuctionStartPriceText), findsOneWidget);
    expect(find.text(StringAssets.createAuctionButtonText), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.newAuctionItemText), '2');
    await tester.enterText(
        find.widgetWithText(
            TextField, StringAssets.newAuctionItemDescriptionText),
        '222222');
    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.newAuctionStartPriceText),
        '1000');
    await tester.tap(find.widgetWithText(
        ElevatedButton, StringAssets.createAuctionButtonText));
    await tester.pumpAndSettle();

    expect(find.text(StringAssets.auctionCreatedText), findsOneWidget);

    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.auctionCreatedOptionYesText));
    await tester.pumpAndSettle();

    expect(find.text('2'), findsOneWidget);
    expect(find.text('222222'), findsOneWidget);
    expect(find.text('${StringAssets.auctionPricePrefix}1000'), findsOneWidget);
    expect(find.text('open'), findsOneWidget);
  });

  testWidgets('auction bid', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Card, skipOffstage: false).last);
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey2);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.biddingAmountText), '3000');
    await tester
        .tap(find.widgetWithText(ElevatedButton, StringAssets.bidButtonText));
    await tester.pumpAndSettle();

    expect(find.text('${StringAssets.auctionPricePrefix}3000'), findsOneWidget);
  });

  testWidgets('auction revoke', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Card).last);
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey2);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester.tap(
        find.widgetWithText(OutlinedButton, StringAssets.revokeButtonText));
    await tester.pumpAndSettle();

    expect(find.text('revoked'), findsOneWidget);
  });

  testWidgets('auction cancel', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Create Auction'));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey1);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.newAuctionItemText), '2');
    await tester.enterText(
        find.widgetWithText(
            TextField, StringAssets.newAuctionItemDescriptionText),
        '222222');
    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.newAuctionStartPriceText),
        '1000');
    await tester.tap(find.widgetWithText(
        ElevatedButton, StringAssets.createAuctionButtonText));
    await tester.pumpAndSettle();

    expect(find.text(StringAssets.auctionCreatedText), findsOneWidget);

    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.auctionCreatedOptionYesText));
    await tester.pumpAndSettle();

    await tester.tap(
        find.widgetWithText(OutlinedButton, StringAssets.cancelButtonText));
    await tester.pumpAndSettle();

    expect(find.text('canceled'), findsOneWidget);
  });

  testWidgets('create auction2', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Create Auction'));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey1);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.newAuctionItemText), '2');
    await tester.enterText(
        find.widgetWithText(
            TextField, StringAssets.newAuctionItemDescriptionText),
        '222222');
    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.newAuctionStartPriceText),
        '1000');
    await tester.tap(find.widgetWithText(
        ElevatedButton, StringAssets.createAuctionButtonText));
    await tester.pumpAndSettle();

    expect(find.text(StringAssets.auctionCreatedText), findsOneWidget);

    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.auctionCreatedOptionYesText));
    await tester.pumpAndSettle();
  });

  testWidgets('auction bid2', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Card).last);
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey2);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.biddingAmountText), '3000');
    await tester
        .tap(find.widgetWithText(ElevatedButton, StringAssets.bidButtonText));
    await tester.pumpAndSettle();

    expect(find.text('${StringAssets.auctionPricePrefix}3000'), findsOneWidget);
  });

  testWidgets('auction end', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Card).last);
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey1);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester
        .tap(find.widgetWithText(OutlinedButton, StringAssets.endButtonText));
    await tester.pumpAndSettle();

    expect(find.text('confirmed'), findsOneWidget);
  });

  testWidgets('auction update shipping info', (WidgetTester tester) async {
    const network = String.fromEnvironment("NETWORK");
    app.main(network: network);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Card).last);
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.privateKeyInputText),
        TestData.ganachePrivateKey1);
    await tester.tap(find.widgetWithText(
        TextButton, StringAssets.userAccountNotFoundGetButtonText));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, StringAssets.shippingInfoText),
        TestData.newShippingInfo);
    await tester.tap(find.widgetWithText(
        ElevatedButton, StringAssets.updateShippingInfoButtonText));
    await tester.pumpAndSettle();

    expect(find.text('completed'), findsOneWidget);
    expect(
        find.text(
            StringAssets.auctionShippingInfoPrefix + TestData.newShippingInfo),
        findsOneWidget);
  });
}
