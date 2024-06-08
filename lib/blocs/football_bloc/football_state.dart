part of 'football_bloc.dart';

@immutable
sealed class FootballState {}

final class FootballInitial extends FootballState {}
final class FootballGetAllFieldLoadingState extends FootballState {}
final class FootballGetAllFieldSuccessState extends FootballState {}
final class FootballGetAllFieldFailState extends FootballState {}
