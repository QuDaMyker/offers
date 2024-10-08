// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_offer_cubit.dart';

class EditOfferState extends Equatable {
  const EditOfferState({
    this.offer,
    required this.loadStatus,
    required this.titleController,
    required this.descriptionController,
    required this.discountPercentageController,
    required this.originalPriceController,
    required this.discountedPriceController,
    required this.createAtPriceController,
    required this.updateAtPriceController,
  });
  final Offer? offer;
  final LoadStatus loadStatus;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController discountPercentageController;
  final TextEditingController originalPriceController;
  final TextEditingController discountedPriceController;
  final TextEditingController createAtPriceController;
  final TextEditingController updateAtPriceController;

  factory EditOfferState.init(
    Offer? offer,
  ) {
    return EditOfferState(
      offer: offer,
      loadStatus: LoadStatus.Init,
      titleController: TextEditingController(text: offer?.title),
      descriptionController: TextEditingController(text: offer?.description),
      discountPercentageController:
          TextEditingController(text: offer?.discountPercentage.toString()),
      originalPriceController:
          TextEditingController(text: offer?.originalPrice.toString()),
      discountedPriceController:
          TextEditingController(text: offer?.discountedPrice.toString()),
      createAtPriceController: TextEditingController(
        text: offer != null && offer.createdAt != null
            ? Helper().formatDateTimeToHHMMDdMmYyyy(
                offer.createdAt!,
              )
            : null,
      ),
      updateAtPriceController: TextEditingController(
        text: offer != null && offer.updatedAt != null
            ? Helper().formatDateTimeToHHMMDdMmYyyy(
                offer.updatedAt!,
              )
            : null,
      ),
    );
  }

  @override
  List<Object> get props => [
        loadStatus,
        titleController,
        descriptionController,
        discountPercentageController,
        originalPriceController,
        discountedPriceController,
        updateAtPriceController,
      ];

  EditOfferState copyWith({
    Offer? offer,
    LoadStatus? loadStatus,
    TextEditingController? titleController,
    TextEditingController? descriptionController,
    TextEditingController? discountPercentageController,
    TextEditingController? originalPriceController,
    TextEditingController? discountedPriceController,
    TextEditingController? updateAtPriceController,
  }) {
    return EditOfferState(
      loadStatus: loadStatus ?? this.loadStatus,
      offer: offer ?? this.offer,
      titleController: titleController ?? this.titleController,
      descriptionController:
          descriptionController ?? this.descriptionController,
      discountPercentageController:
          discountPercentageController ?? this.discountPercentageController,
      originalPriceController:
          originalPriceController ?? this.originalPriceController,
      discountedPriceController:
          discountedPriceController ?? this.discountedPriceController,
      createAtPriceController: createAtPriceController,
      updateAtPriceController:
          updateAtPriceController ?? this.updateAtPriceController,
    );
  }
}
