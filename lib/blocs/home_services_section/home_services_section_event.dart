part of 'home_services_section_bloc.dart';

@immutable
sealed class HomeServicesSectionEvent {}

class GetAllServices extends HomeServicesSectionEvent {}

class UploadImage extends HomeServicesSectionEvent {}

class SelectTimeEvent extends HomeServicesSectionEvent {
  final BuildContext context;

  SelectTimeEvent(this.context);
}

class SelectDateEvent extends HomeServicesSectionEvent {
  final BuildContext context;

  SelectDateEvent(this.context);
}

class GetAllCompaniesByCategoryId extends HomeServicesSectionEvent {
  final String catId;

  GetAllCompaniesByCategoryId(this.catId);
}

class SendRequest extends HomeServicesSectionEvent {}
class GetAllRequests extends HomeServicesSectionEvent {}
