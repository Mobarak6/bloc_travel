import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/features/trip/managers/trip_ops_bloc.dart';
import 'package:travel_app/src/shared/extensions/overlay_extensions.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/validate_check.dart';
import 'package:travel_app/src/shared/widgets/custom_button.dart';
import 'package:travel_app/src/shared/widgets/custom_text_field_widget.dart';
import 'package:travel_app/src/travel_ap_router.gr.dart';

@RoutePage()
class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({required this.userId, super.key});

  final String userId;

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  late TripOpsBloc _tripOpsBloc;
  final _formKey = GlobalKey<FormState>();
  final _destinationController = TextEditingController();
  final _descriptionController = TextEditingController();

  final FocusNode _destinationFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  @override
  void initState() {
    _tripOpsBloc = getIt<TripOpsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _tripOpsBloc,
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.create_trip)),
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.spacingDefault),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(child: ListView(
                  children: [
                    /// Destination
                    CustomTextFieldWidget(
                      labelText: context.l10n.destination,
                      hintText: context.l10n.enter_destination,
                      controller: _destinationController,
                      focusNode: _destinationFocus,
                      inputType: TextInputType.text,
                      prefixIcon: Icons.map,
                      validator: (value) => ValidateCheck.validateEmptyText(
                        context,
                        value?.trim(),
                        context.l10n.enter_destination,
                      ),
                    ),
                    const SizedBox(height: Dimensions.spacingDefault),

                    /// Description
                    CustomTextFieldWidget(
                      labelText: context.l10n.description,
                      hintText: context.l10n.enter_description,
                      controller: _descriptionController,
                      focusNode: _descriptionFocus,
                      inputType: TextInputType.text,
                      prefixIcon: Icons.description,
                      validator: (value) => ValidateCheck.validateEmptyText(
                        context,
                        value?.trim(),
                        context.l10n.enter_description,
                      ),
                    ),

                    /// Start Date
                    BlocBuilder<TripOpsBloc, TripOpsState>(
                      builder: (context, state) {
                        final startDate = state.maybeWhen(
                          selectedDate: (start, end) => start,
                          orElse: () => null,
                        );
                        return ListTile(
                          title: Text(
                            startDate == null
                                ? context.l10n.start_date
                                : startDate.toLocal().toString().split(' ')[0],
                          ),
                          trailing: const Icon(Icons.calendar_today),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) {
                              final endDate = state.maybeWhen(
                                selectedDate: (start, end) => end,
                                orElse: () => null,
                              );
                              _tripOpsBloc.add(
                                TripOpsEvent.selectDate(start: date, end: endDate),
                              );
                            }
                          },
                        );
                      },
                    ),

                    /// End Date
                    BlocBuilder<TripOpsBloc, TripOpsState>(
                      // buildWhen: (prev, curr) =>
                      // curr is _SelectedDate || curr is _Initial,
                      builder: (context, state) {
                        final (startDate, endDate) = state.maybeWhen(
                          selectedDate: (start, end) => (start, end),
                          orElse: () => (null, null),
                        );
                        return ListTile(
                          title: Text(
                            endDate == null
                                ? context.l10n.end_date
                                : endDate.toLocal().toString().split(' ')[0],
                          ),
                          trailing: const Icon(Icons.calendar_today),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: startDate ?? DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) {
                              _tripOpsBloc.add(
                                TripOpsEvent.selectDate(
                                  start: startDate,
                                  end: date,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),

                  ],
                )),

                BlocBuilder<TripOpsBloc, TripOpsState>(
                  builder: (context, state) {
                    final isLoading =
                        state.whenOrNull(inProgress: () => true) ?? false;

                    final (startDate, endDate) = state.maybeWhen(
                      selectedDate: (start, end) => (start, end),
                      orElse: () => (null, null),
                    );

                    return CustomButton(
                      buttonText: context.l10n.create_trip,
                      isLoading: isLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if(startDate == null) {
                            context.showSnackBar(context.l10n.please_select_start_date);
                            return;

                          }

                          if(endDate == null) {
                            context.showSnackBar(context.l10n.please_select_end_date);
                            return;

                          }
                          final trip = Trip(
                            userId: widget.userId,
                            destination: _destinationController.text,
                            startDate: startDate,
                            endDate: endDate,
                            description: _descriptionController.text,
                          );
                          _tripOpsBloc.add(TripOpsEvent.createTrip(trip));
                          context.replaceRoute(
                              TripListRoute(userId: widget.userId));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
