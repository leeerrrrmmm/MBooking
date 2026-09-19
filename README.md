# MBooking — Movie Ticket Booking App
Flutter cinema-booking app: TMDB movie listings, session and seat selection,
test-mode Stripe checkout, and Firebase email auth. The booking flow looks
like a real cinema app; payments stay in Stripe test mode and never charge
live cards.

## Features

- **Movie catalog** — popular and upcoming titles from the **TMDB API**
  (posters, overview, release date, rating, credits). Home shows featured
  lists; **Movie** is a tabbed catalog with pull-to-refresh.
- **Movie details** — backdrop, genres, runtime, cast, and a cinema picker
  (local demo venues). Continue starts a booking draft.
- **Session and seats** — pick date/time, then a seat map (standard / VIP
  rows). Seat occupancy is local mock data, not a live cinema backend.
- **Payment** — **Stripe test mode** via Payment Sheet: card, Google Pay
  (Android), Apple Pay (iOS). Live keys are rejected at startup.
- **Tickets** — confirmed bookings are saved in **Cloud Firestore** under
  the signed-in user. List + flip-card detail with QR / barcode.
- **Auth** — **Firebase Auth** email/password sign-in and sign-up. Session
  is restored on splash; `go_router` redirects guests to auth.
- **Profile** — display name, change password, sign out. Google / Apple
  buttons on login are UI placeholders only.

## Stack
- Flutter / Dart
- Feature-first clean architecture (data / domain / presentation)
- flutter_bloc (Cubit) + GetIt
- go_router (auth-aware redirects)
- Dio (TMDB)
- Firebase Auth + Cloud Firestore
- flutter_stripe (test mode only)
- flutter_dotenv (Stripe keys)
- Freezed / json_serializable

## App structure
| Tab | Screen | Purpose |
| --- | --- | --- |
| Home | Home | Welcome, popular + upcoming |
| Ticket | My ticket | Purchased tickets |
| Movie | Movie | Popular / Upcoming lists |
| Profile | Profile | Account settings |
Flow:
 **Splash → Sign in / Sign up → Home → Details → Seats → Payment → Ticket**.

Dark cinema UI, gold accent `#FCC434`.

## Quick start
Firebase configs and `.env` are gitignored (`firebase_options.dart`,
`android/app/google-services.json`, `.env`). The app will not run until
those are in place.
Firebase is required. Auth, profile, and tickets all depend on it. There
is no built-in “skip login” path.

### 1. Firebase
1. Create a project in [Firebase Console](https://console.firebase.google.com/).
2. Enable **Authentication** → **Email/Password**.
3. Enable **Cloud Firestore** (used for `users` and `users/{uid}/tickets`).
4. Add Android / iOS apps and drop in:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist` (not in the repo yet)
5. Generate `lib/firebase_options.dart`:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
2. Environment
Create .env in the project root (Stripe only):

STRIPE_PUBLISHABLE_KEY=pk_test_xxx
STRIPE_SECRET_KEY=sk_test_xxx
STRIPE_MERCHANT_IDENTIFIER=merchant.com.mbooking
Stripe keys: Stripe Dashboard → Test mode. Keys must start with pk_test_ / sk_test_.

TMDB is not read from .env. Pass it at compile time:

flutter run --dart-define=TMDB_API_KEY=your_tmdb_api_key
Get a key from TMDB API settings. The Dio client uses https://api.themoviedb.org/3.

3. Run
flutter pub get
flutter run --dart-define=TMDB_API_KEY=your_tmdb_api_key
Notes
Cinema list and seat map are demo data (Consts + in-memory booking draft).
Home search field is not wired to TMDB search yet.
Stripe PaymentIntents are created from the device with the test secret key (fine for this pet project; do not use live keys).
Google / Apple sign-in is not implemented.
Flutter docs
Learn Flutter
Write your first Flutter app
Flutter learning resources
Flutter documentation
