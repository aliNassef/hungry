import 'package:flutter_test/flutter_test.dart';
import 'package:hungry/core/di/service_locator.dart';
import 'package:hungry/core/widgets/custom_text_form_field.dart';
import 'package:hungry/core/widgets/default_app_button.dart';
import 'package:hungry/features/auth/data/repo/auth_repo.dart';
import 'package:hungry/features/auth/presentation/views/login_view.dart';
import 'package:hungry/features/auth/presentation/widgets/login_view_body.dart';
import 'package:hungry/features/home/data/repo/home_repo.dart';
import 'package:hungry/features/layout/presentation/views/layout_view.dart';
import 'package:hungry/hungry_app.dart';
import 'package:integration_test/integration_test.dart';
import 'fake_api.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('End To End Test', () {
    setUpAll(() async {
      setupServiceLocator();
      injector.unregister<AuthRepo>();
      injector.unregister<HomeRepo>();
      injector.registerLazySingleton<AuthRepo>(() => FakeAuthRepo());
      injector.registerLazySingleton<HomeRepo>(() => FakeHomeRepo());
      await injector<AuthRepo>().isLoggedIn();
    });

    testWidgets('TestLogin', (WidgetTester tester) async {
      await tester.pumpWidget(const HungryApp());
      //? splash
      await tester.pumpAndSettle(const Duration(seconds: 5));

      //! goes to login view
      expect(find.byType(LoginView), findsOneWidget);
      expect(find.byType(LoginViewBody), findsOneWidget);
      expect(find.text('Welcome Back, Please Login'), findsOneWidget);

      ///* take input
      await tester.enterText(
        find.widgetWithText(CustomTextFormField, 'Email'),
        'test@gmail.com',
      );
      await tester.enterText(
        find.widgetWithText(CustomTextFormField, 'Password'),
        'Aa*12345*',
      );

      //! tap login btn
      await tester.tap(find.widgetWithText(DefaultAppButton, 'Login'));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(LoginView), findsNothing);
      expect(find.byType(LayoutView), findsOneWidget);
      // expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Hungry?'), findsOneWidget);
    });
  });
}
