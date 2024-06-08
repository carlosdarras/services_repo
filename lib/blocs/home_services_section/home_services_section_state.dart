part of 'home_services_section_bloc.dart';

@immutable
sealed class HomeServicesSectionState {}

final class HomeServicesSectionInitial extends HomeServicesSectionState {}
final class HomeServicesSectionUploadImageLoadingState extends HomeServicesSectionState {}
final class HomeServicesSectionUploadImageSuccessState  extends HomeServicesSectionState {}
final class HomeServicesSectionUploadImageFailState  extends HomeServicesSectionState {}
final class HomeServicesSectionSelectTimeState  extends HomeServicesSectionState {}
final class HomeServicesSectionSelectDateState  extends HomeServicesSectionState {}
final class HomeServicesSendRequestLoading  extends HomeServicesSectionState {}
final class HomeServicesSendRequestSuccess  extends HomeServicesSectionState {}
final class HomeServicesSendRequestFail  extends HomeServicesSectionState {}

final class HomeServicesGetAllRequestLoading  extends HomeServicesSectionState {}
final class HomeServicesGetAllRequestSuccess  extends HomeServicesSectionState {}
final class HomeServicesGetAllRequestFail  extends HomeServicesSectionState {}

final class HomeServicesGetCompaniesLoading  extends HomeServicesSectionState {}
final class HomeServicesGetCompaniesSuccess  extends HomeServicesSectionState {}
final class HomeServicesGetCompaniesFail  extends HomeServicesSectionState {}
