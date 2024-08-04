import '../../app/extensions.dart';
import '../../app/constant.dart';
import '../responses/responses.dart';
import '../../domain/model/model.dart';

// extension CustomerResponseMapper on CustomerResponse? {
//   Customer toDomain() {
//     return Customer(
//         this?.id?.orEmpty() ?? EMPTY,
//         this?.name?.orEmpty() ?? EMPTY,
//         this?.numOfNotifications?.orZero() ?? ZERO);
//   }
// }

// extension ActivityDataResponseMapper on ActivityResponse {
//   List<ActivityData> toDomain() {
//     List<ActivityData> activity = <ActivityData>[];
//     for (var activityRow in rows) {
//       List<String> topics = <String>["Lession 1", "Lession 2"];
//       activity.add(ActivityData(activityRow.id, activityRow.data.name,
//           activityRow.data.description, topics));
//     }
//     print(activity);
//     return activity;
//   }
// }
// extension ContactsResponseMapper on ContactsResponse? {
//   Contacts toDomain() {
//     return Contacts(this?.email?.orEmpty() ?? EMPTY,
//         this?.phone?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
//   }
// }

// extension AuthenticationResponseMapper on AuthenticationResponse? {
//   Authentication toDomain() {
//     return Authentication(
//         this?.customer?.toDomain(), this?.contacts?.toDomain());
//   }
// }

// extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
//   String toDomain() {
//     return this?.support?.orEmpty() ?? EMPTY;
//   }
// }

// extension ServiceResponseMapper on ServiceResponse? {
//   Service toDomain() {
//     return Service(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
//         this?.image?.orEmpty() ?? EMPTY);
//   }
// }

// extension StoreResponseMapper on StoreResponse? {
//   Store toDomain() {
//     return Store(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
//         this?.image?.orEmpty() ?? EMPTY);
//   }
// }

// extension BannerResponseMapper on BannerResponse? {
//   BannerAd toDomain() {
//     return BannerAd(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
//         this?.image?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
//   }
// }

// extension HomeResponseMapper on HomeResponse? {
//   HomeObject toDomain() {
//     List<Service> mappedServices =
//         (this?.data?.services?.map((service) => service.toDomain()) ??
//                 const Iterable.empty())
//             .cast<Service>()
//             .toList();

//     List<Store> mappedStores =
//         (this?.data?.stores?.map((store) => store.toDomain()) ??
//                 const Iterable.empty())
//             .cast<Store>()
//             .toList();

//     List<BannerAd> mappedBanners =
//         (this?.data?.banners?.map((bannerAd) => bannerAd.toDomain()) ??
//                 const Iterable.empty())
//             .cast<BannerAd>()
//             .toList();

//     var data = HomeData(mappedServices, mappedStores, mappedBanners);
//     return HomeObject(data);
//   }
// }
