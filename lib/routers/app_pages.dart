// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class AppPages {
//   static RouteSettings? routeSettings;

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     routeSettings = settings;
//     final args = settings.arguments;
//     switch (settings.name) {
//       // case AppRoutes.login:
//       //   return _createRoute(page: const LoginScreen());

//       // case AppRoutes.splash:
//       //   return _createRoute(page: const SplashScreen());
//       // case AppRoutes.register:
//       //   return _createRoute(page: RegisterScreen());
//       // case AppRoutes.otp:
//       //   args as OtpScreen;
//       //   return _createRoute(
//       //       page: OtpScreen(
//       //     verifyTypeOtp: args.verifyTypeOtp,
//       //     email: args.email,
//       //     password: args.password,
//       //     verificationId: args.verificationId,
//       //   ));
//       // case AppRoutes.login:
//       //   return _createRoute(page: const LoginScreen());
//       // case AppRoutes.forgotPassword:
//       //   return _createRoute(page: ForgotPassword());
//       // case AppRoutes.changeNewPassword:
//       //   args as ResetNewPasswordScreen;

//       //   return _createRoute(
//       //       page: ResetNewPasswordScreen(
//       //     email: args.email,
//       //     otp: args.otp,
//       //   ));
//       // case AppRoutes.search:
//       //   return _createRoute(page: const InitSearchScreen());
//       // case AppRoutes.searchToGo:
//       //   return _createRoute(page: const SearchToGoScreen());
//       // case AppRoutes.welcome:
//       //   return _createRoute(page: const WelcomeScreen());
//       // case AppRoutes.resultSearch:
//       //   args as ResultSearchScreen;
//       //   return _createRoute(
//       //     page: ResultSearchScreen(
//       //       type: args.type,
//       //       initParams: args.initParams,
//       //     ),
//       //   );
//       // case AppRoutes.myBooking:
//       //   return _createRoute(page: const MyBookingScreen());
//       // case AppRoutes.bookingHotelDetail:
//       //   args as MyBookingHotelDetailScreen;
//       //   return _createRoute(page: MyBookingHotelDetailScreen(bookingId: args.bookingId));
//       // case AppRoutes.bookingSpaDetail:
//       //   args as BookingDetailSpaScreen;
//       //   return _createRoute(page: BookingDetailSpaScreen(bookingId: args.bookingId));
//       // case AppRoutes.bookingRestaurantDetail:
//       //   args as BookingRestaurantDetailScreen;
//       //   return _createRoute(
//       //       page: BookingRestaurantDetailScreen(
//       //     bookingId: args.bookingId,
//       //     isFromByQR: args.isFromByQR,
//       //   ));
//       // case AppRoutes.myBookingQR:
//       //   args as MyBookingQRCodeScreen;
//       //   return _createRoute(
//       //     page: MyBookingQRCodeScreen(
//       //       bookingId: args.bookingId,
//       //       shopModel: args.shopModel,
//       //     ),
//       //   );
//       // case AppRoutes.bookingSpaService:
//       //   args as ServiceBookingSpaScreen;
//       //   return _createRoute(
//       //     page: ServiceBookingSpaScreen(
//       //       shopId: args.shopId,
//       //       initPackage: args.initPackage,
//       //       initService: args.initService,
//       //     ),
//       //   );
//       // case AppRoutes.bookingSpa:
//       //   args as BookingSpaScreen;
//       //   return _createRoute(
//       //     page: BookingSpaScreen(
//       //       shopModel: args.shopModel,
//       //       filter: args.filter,
//       //       initPackage: args.initPackage,
//       //       initService: args.initService,
//       //     ),
//       //   );
//       // case AppRoutes.bookingHotelCart:
//       //   args as CartHotelRoomBookingScreen;
//       //   return _createRoute(
//       //     page: CartHotelRoomBookingScreen(
//       //       shopModel: args.shopModel,
//       //       filter: args.filter,
//       //     ),
//       //   );
//       // case AppRoutes.bookingHotel:
//       //   args as BookingHotelScreen;
//       //   return _createRoute(
//       //     page: BookingHotelScreen(
//       //       shopModel: args.shopModel,
//       //       rooms: args.rooms,
//       //       filter: args.filter,
//       //     ),
//       //   );
//       // case AppRoutes.tripPlanAI:
//       //   return _createRoute(page: const TripPlanAI());
//       // case AppRoutes.detailHotel:
//       //   args as DetailHotelScreen;
//       //   return _createRoute(
//       //       page: DetailHotelScreen(
//       //     shopId: args.shopId,
//       //     filter: args.filter,
//       //   ));
//       // case AppRoutes.productsBookingRestaurant:
//       //   args as ProductsBookingRestaurantScreen;
//       //   return _createRoute(
//       //     page: ProductsBookingRestaurantScreen(
//       //       shopId: args.shopId,
//       //       productsBooking: args.productsBooking,
//       //       isTableSpecial: args.isTableSpecial,
//       //     ),
//       //   );
//       // case AppRoutes.productsBookingByQR:
//       //   args as ProductsBookingByQRScreen;
//       //   return _createRoute(
//       //     page: ProductsBookingByQRScreen(
//       //       shopId: args.shopId,
//       //       productsPreBooking: args.productsPreBooking,
//       //       isTableSpecial: args.isTableSpecial,
//       //       initTab: args.initTab,
//       //       bookingId: args.bookingId,
//       //     ),
//       //   );
//       // case AppRoutes.detailRestaurant:
//       //   args as DetailRestaurantScreen;
//       //   return _createRoute(
//       //     page: DetailRestaurantScreen(
//       //       shopId: args.shopId,
//       //       filter: args.filter,
//       //     ),
//       //   );
//       // case AppRoutes.detailSpa:
//       //   args as DetailSpaScreen;
//       //   return _createRoute(
//       //     page: DetailSpaScreen(
//       //       shopId: args.shopId,
//       //       filter: args.filter,
//       //     ),
//       //   );
//       // case AppRoutes.hotelRoom:
//       //   args as HotelRoomScreen;
//       //   return _createRoute(
//       //     page: HotelRoomScreen(
//       //       shopModel: args.shopModel,
//       //       productId: args.productId,
//       //       filter: args.filter,
//       //     ),
//       //   );
//       // case AppRoutes.detailUserProfile:
//       //   return _createRoute(page: const DetailProfileScreen());
//       // case AppRoutes.listReservations:
//       //   return _createRoute(page: const ListReservationsScreen());
//       // case AppRoutes.categoryHotel:
//       //   return _createRoute(page: const CategoryHotelScreen());
//       // case AppRoutes.categoryRestaurant:
//       //   return _createRoute(page: const CategoryRestaurantScreen());
//       // case AppRoutes.categorySpa:
//       //   return _createRoute(page: const CategorySpaScreen());
//       // case AppRoutes.bookingRestaurant:
//       //   args as BookingRestaurantScreen;
//       //   return _createRoute(
//       //       page: BookingRestaurantScreen(
//       //     shopModel: args.shopModel,
//       //     filter: args.filter,
//       //   ));
//       // case AppRoutes.editUserProfile:
//       //   return _createRoute(page: const EditUserScreen());
//       // case AppRoutes.messages:
//       //   return _createRoute(page: const MessageScreen());
//       // case AppRoutes.detailMessage:
//       //   args as MessageDetailScreen;
//       //   return _createRoute(
//       //       page: MessageDetailScreen(
//       //     idConversation: args.idConversation,
//       //     type: args.type,
//       //     shopModel: args.shopModel,
//       //     shopId: args.shopId,
//       //   ));
//       // case AppRoutes.detailMessageSupport:
//       //   args as MessageSupportDetailScreen;
//       //   return _createRoute(
//       //       page: MessageSupportDetailScreen(
//       //     idConversation: args.idConversation,
//       //   ));
//       // case AppRoutes.changePassword:
//       //   return _createRoute(page: ChangePasswordScreen());
//       // case AppRoutes.followingShop:
//       //   return _createRoute(page: FollowingShopScreen());
//       // case AppRoutes.voucher:
//       //   VoucherScreen? params;
//       //   if (args != null) {
//       //     params = args as VoucherScreen;
//       //   }
//       //   return _createRoute(
//       //     page: VoucherScreen(
//       //       shopId: params?.shopId,
//       //       initVoucherIdSelected: params?.initVoucherIdSelected,
//       //       filterVoucherByShop: params?.filterVoucherByShop,
//       //       hideNex: params?.hideNex ?? false,
//       //       isSelected: params?.isSelected ?? true,
//       //     ),
//       //   );
//       // case AppRoutes.voucherDetail:
//       //   args as VoucherDetailScreen;
//       //   return _createRoute(
//       //       page: VoucherDetailScreen(voucherModel: args.voucherModel));
//       // case AppRoutes.setupGoTo:
//       //   return _createRoute(page: const SetupToGoScreen());
//       // case AppRoutes.requestOrder:
//       //   return _createRoute(page: const RequestOrderScreen());
//       // case AppRoutes.myPostReview:
//       //   return _createRoute(page: const MyPostReviewScreen());
//       // case AppRoutes.addReviewShop:
//       //   args as AddReviewShopScreen;
//       //   return _createRoute(
//       //       page: AddReviewShopScreen(
//       //     shopModel: args.shopModel,
//       //     bookingId: args.bookingId,
//       //   ));
//       // case AppRoutes.categoryHotelRoom:
//       //   args as CategoryHotelRoomScreen;
//       //   return _createRoute(
//       //       page:
//       //           CategoryHotelRoomScreen(shop: args.shop, filter: args.filter));
//       // case AppRoutes.servicesSpa:
//       //   args as ServicesSpaScreen;
//       //   return _createRoute(page: ServicesSpaScreen(shopId: args.shopId));
//       // case AppRoutes.searchAll:
//       //   SearchAllScreen? params;
//       //   if (args != null && args is SearchAllScreen) {
//       //     params = args;
//       //   }
//       //   return _createRoute(
//       //     page: SearchAllScreen(
//       //       initKeySearch: params?.initKeySearch,
//       //       categoryType: params?.categoryType,
//       //     ),
//       //   );
//       // case AppRoutes.shopReviews:
//       //   args as ReviewsShopScreen;
//       //   return _createRoute(
//       //     page: ReviewsShopScreen(
//       //       shop: args.shop,
//       //       initRating: args.initRating,
//       //     ),
//       //   );
//       // case AppRoutes.dealPromoOfShop:
//       //   args as PromoOfShopScreen;
//       //   return _createRoute(
//       //     page: PromoOfShopScreen(
//       //       shopModel: args.shopModel,
//       //     ),
//       //   );
//       // case AppRoutes.detailPromotion:
//       //   args as PromotionDetail;
//       //   return _createRoute(
//       //     page: PromotionDetail(
//       //       shopModel: args.shopModel,
//       //       promotionShopModel: args.promotionShopModel,
//       //     ),
//       //   );
//       // case AppRoutes.dealPopular:
//       //   PopularDealScreen? argument;
//       //   if (args != null) {
//       //     argument = args as PopularDealScreen;
//       //   }
//       //   return _createRoute(
//       //     page: PopularDealScreen(categoryType: argument?.categoryType),
//       //   );
//       // case AppRoutes.categoryProductRestaurant:
//       //   args as CategoryRestaurantProductScreen;
//       //   return _createRoute(
//       //     page: CategoryRestaurantProductScreen(shop: args.shop),
//       //   );
//       // case AppRoutes.settingsAccount:
//       //   return _createRoute(page: SettingsAccountScreen());
//       // case AppRoutes.notifications:
//       //   return _createRoute(page: NotificationScreen());
//       // case AppRoutes.paymentMethodCardList:
//       //   bool isSelect = false;
//       //   if (args != null && args is bool) {
//       //     isSelect = args;
//       //   }
//       //   return _createRoute(page: ListMethodCardScreen(isSelected: isSelect));
//       // case AppRoutes.paymentMethodAddCard:
//       //   bool isInitCard = false;
//       //   if (args != null && args is bool) {
//       //     isInitCard = args;
//       //   }
//       //   return _createRoute(page: AddCardScreen(isInitCard: isInitCard));
//       // case AppRoutes.aboutUs:
//       //   return _createRoute(page: const AboutUsScreen());
//       // case AppRoutes.reschedule:
//       //   return _createRoute(page: const RescheduleScreen());
//       // case AppRoutes.transactionSapphireHistory:
//       //   return _createRoute(page: const TransactionSapphireHistoryScreen());
//       // case AppRoutes.eventSinglePageDetail:
//       //   args as EventSinglePageDetailScreen;
//       //   return _createRoute(
//       //       page: EventSinglePageDetailScreen(model: args.model));
//       // case AppRoutes.bookingByQR:
//       //   args as BookingByQRScreen;
//       //   return _createRoute(
//       //     page: BookingByQRScreen(
//       //       shopId: args.shopId,
//       //       zoneId: args.zoneId,
//       //       tableId: args.tableId,
//       //     ),
//       //   );
//       // case AppRoutes.topupSapphire:
//       //   return _createRoute(page: const TopUpSapphireScreen());
//       default:
//         return _emptyRoute(settings);
//     }
//   }

//   static Route _createRoute({
//     required Widget page,
//     PageTransitionType? transition,
//   }) {
//     return PageRouteBuilder(
//       settings: RouteSettings(
//           arguments: routeSettings?.arguments, name: routeSettings?.name),
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         if (transition == null) {
//           return FadeTransition(
//             opacity: animation,
//             child: child,
//           );
//         }
//         switch (transition) {
//           case PageTransitionType.fade:
//             return FadeTransition(
//               opacity: animation,
//               child: child,
//             );
//           case PageTransitionType.rightToLeft:
//             const begin = Offset(1.0, 0.0);
//             const end = Offset.zero;
//             const curve = Curves.ease;
//             var tween =
//                 Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//             return SlideTransition(
//               position: animation.drive(tween),
//               child: child,
//             );
//           case PageTransitionType.leftToRight:
//             const begin = Offset(-1.0, 0.0);
//             const end = Offset.zero;
//             const curve = Curves.ease;
//             var tween =
//                 Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//             return SlideTransition(
//               position: animation.drive(tween),
//               child: child,
//             );
//           case PageTransitionType.bottomToTop:
//             const begin = Offset(0.0, 1.0); // Start below the screen
//             const end = Offset.zero; // End at the widget's natural position
//             const curve = Curves.ease; // The easing curve

//             var tween =
//                 Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//             return SlideTransition(
//               position: animation.drive(tween),
//               child: child,
//             );
//         }
//       },
//     );
//   }

//   static MaterialPageRoute _emptyRoute(RouteSettings settings) {
//     return MaterialPageRoute(
//       builder: (context) => Scaffold(
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () => Navigator.of(context).pop(),
//             child: Center(
//               child: Text(
//                 "Back".tr(),
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         ),
//         body: Center(
//           child: Text('No path for ${settings.name}'),
//         ),
//       ),
//     );
//   }
// }

// enum PageTransitionType { fade, rightToLeft, leftToRight, bottomToTop }
