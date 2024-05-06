// abstract class DashboardPageState {
//   //
// }

// class DashboardPageInitialState extends DashboardPageState{
//   //
// }

part of 'dashboard_page_bloc.dart';

enum DashboardViewState {
  initial,
  loading,
  error,
  loaded,
}

class DashboardPageState extends Equatable {
  final DashboardViewState dashboardViewState;
  final String? successMessage;
  final AbsencesResponseModel? absencesResponseModel;
  final String? selectedAbsenceType;
  final List<AbsencesPayload> absencesCopyData;
  final List<AbsencesPayload> absencesTypeList;
  final List<AbsencesPayload> absencesDetails;
  final List<MemberPayload> memberPayload;
  final String? selectedDate;
  final int? pageNumber;
  final int? pageSize;

  const DashboardPageState({
    required this.dashboardViewState,
    this.successMessage,
    this.absencesResponseModel,
    this.selectedAbsenceType,
    required this.absencesCopyData,
    required this.absencesTypeList,
    required this.absencesDetails,
    required this.memberPayload,
    required this.selectedDate,
    required this.pageNumber,
    required this.pageSize,
  });

  DashboardPageState copyWith({
    DashboardViewState? dashboardPageState,
    String? successMessage,
    AbsencesResponseModel? absencesResponseModel,
    String? selectedAbsenceType,
    List<AbsencesPayload>? absencesCopyData,
    List<AbsencesPayload>? absencesTypeList,
    List<AbsencesPayload>? absencesDetails,
    List<MemberPayload>? memberPayload,
    String? selectedDate,
    int? pageNumber,
    int? pageSize,
  }) {
    return DashboardPageState(
      dashboardViewState: dashboardPageState ?? dashboardViewState,
      successMessage: successMessage ?? this.successMessage,
      absencesResponseModel:
          absencesResponseModel ?? this.absencesResponseModel,
      selectedAbsenceType: selectedAbsenceType ?? this.selectedAbsenceType,
      absencesCopyData: absencesCopyData ?? this.absencesCopyData,
      absencesTypeList: absencesTypeList ?? this.absencesTypeList,
      absencesDetails: absencesDetails ?? this.absencesDetails,
      memberPayload: memberPayload ?? this.memberPayload,
      selectedDate: selectedDate ?? this.selectedDate,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [
        dashboardViewState,
        successMessage,
        absencesResponseModel,
        selectedAbsenceType,
        absencesTypeList,
        absencesDetails,
        memberPayload,
        selectedDate,
        pageNumber,
        pageSize,
      ];
}
