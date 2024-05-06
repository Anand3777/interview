import 'package:crewmeister/core/resources/constants.dart';
import 'package:crewmeister/core/shared/progress_loader.dart';
import 'package:crewmeister/features/dashboard/data/models/member_response_model.dart';
import 'package:crewmeister/features/dashboard/presentation/bloc/dashboard_page_bloc.dart';
import 'package:crewmeister/features/dashboard/presentation/pages/widgets/from_date_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DashboardPageBig extends StatefulWidget {
  const DashboardPageBig({super.key});

  @override
  State<DashboardPageBig> createState() => _DashboardPageBigState();
}

class _DashboardPageBigState extends State<DashboardPageBig> {
  String? selectedAbsenceType;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    BlocProvider.of<DashboardPageBloc>(context).add(DashboardPageInitialEvent(
      isFromReset: false,
    ));
    fromDateController.text = ' - ';
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(244, 241, 228, 1),
        title: const Text(ksAbsenceManager),
      ),
      body: BlocConsumer<DashboardPageBloc, DashboardPageState>(
        listener: (context, state) {
          ///
        },
        buildWhen: (previous, current) {
          return current.dashboardViewState == DashboardViewState.loaded ||
              current.dashboardViewState == DashboardViewState.loading;
        },
        builder: (context, state) {
          if (state.dashboardViewState == DashboardViewState.loaded) {
            ///
          }
          return Stack(
            children: [
              buildBodyUI(context, state),
              buildLoadingUI(state),
            ],
          );
        },
      ),
    );
  }

  Widget buildLoadingUI(state) {
    return (state.dashboardViewState == DashboardViewState.loading &&
            state.pageNumber == 0)
        ? const ProgressLoader()
        : Container();
  }

  void _loadMoreData(DashboardPageState state) {
    if (state.dashboardViewState == DashboardViewState.loading) {
      return;
    }
    BlocProvider.of<DashboardPageBloc>(context).add(LoadMoreEvent(
      selectedValue: state.selectedAbsenceType,
      absencesCopyData: state.absencesCopyData,
      selectedDate: state.selectedDate,
      pageNumber: (state.pageNumber ?? 0) + 1,
      pageSize: (state.pageSize ?? 0) + 10,
      absencesDetails: state.absencesDetails,
      absencesTypeList: state.absencesTypeList,
      memberPayload: state.memberPayload,
    ));
  }

  Widget buildBodyUI(BuildContext context, DashboardPageState state) {
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            _loadMoreData(state);
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ksFilterabsencesbytype,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: state.absencesTypeList.isEmpty
                                ? []
                                : (state.absencesTypeList).map(
                                    (selectedAbsenceFilter) {
                                      return DropdownMenuItem(
                                        value: selectedAbsenceFilter.type ?? '',
                                        child: Text(
                                            (selectedAbsenceFilter.type ?? '')
                                                .capitalize()),
                                      );
                                    },
                                  ).toList(),
                            value: selectedAbsenceType,
                            onChanged: (value) {
                              selectedAbsenceType = null;
                              selectedAbsenceType = value.toString();
                              BlocProvider.of<DashboardPageBloc>(context).add(
                                AbsenceTypeTapEvent(
                                  selectedValue: value.toString(),
                                  absencesCopyData: state.absencesCopyData,
                                  selectedDate: state.selectedDate,
                                  pageNumber: state.pageNumber ?? 0,
                                  pageSize: state.pageSize ?? 0,
                                ),
                              );
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 55,
                              width: 250,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(06),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.expand_more,
                              ),
                              iconSize: 20,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(06),
                              ),
                              offset: const Offset(0, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(06),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 40,
                              selectedMenuItemBuilder: (context, child) {
                                return Container(
                                  color: const Color.fromRGBO(244, 241, 228, 1),
                                  child: child,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ksSelectDate,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: FromDateWidget(
                            fromDateController: fromDateController,
                            state: state,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    OutlinedButton.icon(
                      onPressed: () {
                        selectedAbsenceType = null;
                        fromDateController.text = ' - ';
                        BlocProvider.of<DashboardPageBloc>(context)
                            .add(DashboardPageInitialEvent(
                          isFromReset: true,
                        ));
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.black,
                        size: 20,
                      ),
                      label: const Text(
                        ksReset,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const Text(
                      '$ksTotalAbsences : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.absencesDetails.length.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                buildHeaderUI(),
                (state.dashboardViewState == DashboardViewState.loaded &&
                        state.absencesDetails.isEmpty)
                    ? const SizedBox(
                        height: 100,
                        child: Center(child: Text('$ksNoabsencesfound!. . .')))
                    : ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: state.absencesDetails.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildItemRow(state, index);
                        },
                      ),
                (state.dashboardViewState == DashboardViewState.loading &&
                        ((state.pageNumber ?? 0) > 0))
                    ? Container(
                        color: Colors.transparent,
                        height: 40,
                        child: const ProgressLoader(),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeaderUI() {
    double bodyWidth = MediaQuery.of(context).size.width - (40 + 40);
    return Container(
      width: bodyWidth,
      height: 60,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(244, 241, 228, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: (bodyWidth - 40) / 6,
                child: const Text(
                  ksMemberName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (bodyWidth - 40) / 6,
                child: const Text(
                  ksTypeofabsence,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (bodyWidth - 40) / 6,
                child: const Text(
                  ksPeriod,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (bodyWidth - 40) / 6,
                child: const Text(
                  ksMemberNotes,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (bodyWidth - 40) / 6,
                child: const Text(
                  ksStatus,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (bodyWidth - 40) / 6,
                child: const Text(
                  ksAdmitterNotes,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemRow(DashboardPageState state, int index) {
    double bodyWidth = MediaQuery.of(context).size.width - (40 + 40);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: (bodyWidth - 40) / 6,
                  child: Text(
                    getMemberName(
                        state, (state.absencesDetails[index].userId ?? 0)),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: (bodyWidth - 40) / 6,
                  child: Text(
                    (state.absencesDetails[index].type ?? ' - ').capitalize(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: (bodyWidth - 40) / 6,
                  child: Text(
                    '${convertDateTimeDisplay(state.absencesDetails[index].startDate ?? ' - ')}\n${convertDateTimeDisplay(state.absencesDetails[index].endDate ?? ' - ')}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: (bodyWidth - 40) / 6,
                  child: Text(
                    state.absencesDetails[index].memberNote ?? ' - ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: (bodyWidth - 40) / 6,
                  child: buildStatus(index, state),
                ),
                SizedBox(
                  width: (bodyWidth - 40) / 6,
                  child: Text(
                    state.absencesDetails[index].admitterNote ?? ' - ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget buildStatus(int index, state) {
    if (state.absencesDetails[index].rejectedAt == null) {
      return Text(
        state.absencesDetails[index].rejectedAt == null
            ? ksRequested
            : ksRejected,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return const Text(
        ksConfirmed,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
    final DateFormat serverFormater = DateFormat('dd-MMM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

String getMemberName(DashboardPageState state, int userID) {
  List<MemberPayload> temp = state.memberPayload;
  temp = temp.where((o) => o.userId == userID).toList();
  return temp.first.name ?? '';
}
