import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mbooking/app/app.dart';
import 'package:mbooking/core/di/injection.dart';
import 'package:mbooking/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await dotenv.load(fileName: '.env');
  final publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  final secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  if (!publishableKey.startsWith('pk_test_') ||
      !secretKey.startsWith('sk_test_')) {
    throw StateError(
      'Stripe test keys required. Live keys are not allowed in this app.',
    );
  }
  Stripe.publishableKey = publishableKey;
  Stripe.merchantIdentifier =
      dotenv.env['STRIPE_MERCHANT_IDENTIFIER'] ?? 'merchant.com.mbooking';
  await Stripe.instance.applySettings();

  await initDependencies();
  runApp(const App());
}
