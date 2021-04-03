import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/ui/detail.dart';
import 'package:ethereum_auction/ui/home.dart';
import 'package:ethereum_auction/ui/new.dart';
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_data.dart';
import 'test_utils.dart';

void main() {
  testWidgets('Home page test', (WidgetTester tester) async {
    final state = AppState.initiatlize()
        .rebuild((b) => b.auctionSummaries.replace(TestData.auctionSummaries));
    await tester.pumpWidget(buildWidgetWithState(
        state: state, widget: MyHomePage(title: StringAssets.mainPageTitle)));
    await expectLater(find.byType(MyHomePage), matchesGoldenFile('home.png'));
  });

  testWidgets('New page test', (WidgetTester tester) async {
    final state =
        AppState.initiatlize().rebuild((b) => b.user.replace(TestData.user));

    await tester.pumpWidget(buildWidgetWithState(
        state: state, widget: NewPage(title: StringAssets.newPageTitle)));
    await expectLater(find.byType(NewPage), matchesGoldenFile('new.png'));
  });

  testWidgets('Detail page test', (WidgetTester tester) async {
    final state = AppState.initiatlize().rebuild((b) {
      b.user.replace(TestData.user);
      b.auctionDetail.replace(TestData.auctionDetail);
    });

    await tester.pumpWidget(buildWidgetWithState(
        state: state, widget: DetailPage(title: StringAssets.detailPageTitle)));
    await expectLater(find.byType(DetailPage), matchesGoldenFile('detail.png'));
  });
}
