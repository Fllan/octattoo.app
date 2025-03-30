/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../features/customer/models/customer.dart' as _i2;
import '../../../features/tattoo_artist/models/tattoo_artist.dart' as _i3;
import '../../../features/workplace/models/workplace.dart' as _i4;
import '../../../features/tattoo_project/models/tattoo_project.dart' as _i5;
import '../../../features/finance/models/quotation.dart' as _i6;
import '../../../features/shared/models/workflow_status.dart' as _i7;

/// An Invoice from a TattooArtist to a Customer to get payment
abstract class Invoice implements _i1.SerializableModel {
  Invoice._({
    this.id,
    required this.customerId,
    this.customer,
    required this.tattooArtistId,
    this.tattooArtist,
    this.workplaceId,
    this.workplace,
    this.tattooProjectId,
    this.tattooProject,
    this.quotationId,
    this.quotation,
    required this.price,
    required this.status,
  });

  factory Invoice({
    int? id,
    required int customerId,
    _i2.Customer? customer,
    required int tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? quotationId,
    _i6.Quotation? quotation,
    required int price,
    required _i7.WorkflowStatus status,
  }) = _InvoiceImpl;

  factory Invoice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Invoice(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.Customer.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      tattooArtistId: jsonSerialization['tattooArtistId'] as int,
      tattooArtist: jsonSerialization['tattooArtist'] == null
          ? null
          : _i3.TattooArtist.fromJson(
              (jsonSerialization['tattooArtist'] as Map<String, dynamic>)),
      workplaceId: jsonSerialization['workplaceId'] as int?,
      workplace: jsonSerialization['workplace'] == null
          ? null
          : _i4.Workplace.fromJson(
              (jsonSerialization['workplace'] as Map<String, dynamic>)),
      tattooProjectId: jsonSerialization['tattooProjectId'] as int?,
      tattooProject: jsonSerialization['tattooProject'] == null
          ? null
          : _i5.TattooProject.fromJson(
              (jsonSerialization['tattooProject'] as Map<String, dynamic>)),
      quotationId: jsonSerialization['quotationId'] as int?,
      quotation: jsonSerialization['quotation'] == null
          ? null
          : _i6.Quotation.fromJson(
              (jsonSerialization['quotation'] as Map<String, dynamic>)),
      price: jsonSerialization['price'] as int,
      status:
          _i7.WorkflowStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int customerId;

  _i2.Customer? customer;

  int tattooArtistId;

  _i3.TattooArtist? tattooArtist;

  int? workplaceId;

  _i4.Workplace? workplace;

  int? tattooProjectId;

  _i5.TattooProject? tattooProject;

  int? quotationId;

  _i6.Quotation? quotation;

  int price;

  _i7.WorkflowStatus status;

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Invoice copyWith({
    int? id,
    int? customerId,
    _i2.Customer? customer,
    int? tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? quotationId,
    _i6.Quotation? quotation,
    int? price,
    _i7.WorkflowStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'tattooArtistId': tattooArtistId,
      if (tattooArtist != null) 'tattooArtist': tattooArtist?.toJson(),
      if (workplaceId != null) 'workplaceId': workplaceId,
      if (workplace != null) 'workplace': workplace?.toJson(),
      if (tattooProjectId != null) 'tattooProjectId': tattooProjectId,
      if (tattooProject != null) 'tattooProject': tattooProject?.toJson(),
      if (quotationId != null) 'quotationId': quotationId,
      if (quotation != null) 'quotation': quotation?.toJson(),
      'price': price,
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InvoiceImpl extends Invoice {
  _InvoiceImpl({
    int? id,
    required int customerId,
    _i2.Customer? customer,
    required int tattooArtistId,
    _i3.TattooArtist? tattooArtist,
    int? workplaceId,
    _i4.Workplace? workplace,
    int? tattooProjectId,
    _i5.TattooProject? tattooProject,
    int? quotationId,
    _i6.Quotation? quotation,
    required int price,
    required _i7.WorkflowStatus status,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          tattooArtistId: tattooArtistId,
          tattooArtist: tattooArtist,
          workplaceId: workplaceId,
          workplace: workplace,
          tattooProjectId: tattooProjectId,
          tattooProject: tattooProject,
          quotationId: quotationId,
          quotation: quotation,
          price: price,
          status: status,
        );

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Invoice copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? tattooArtistId,
    Object? tattooArtist = _Undefined,
    Object? workplaceId = _Undefined,
    Object? workplace = _Undefined,
    Object? tattooProjectId = _Undefined,
    Object? tattooProject = _Undefined,
    Object? quotationId = _Undefined,
    Object? quotation = _Undefined,
    int? price,
    _i7.WorkflowStatus? status,
  }) {
    return Invoice(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.Customer? ? customer : this.customer?.copyWith(),
      tattooArtistId: tattooArtistId ?? this.tattooArtistId,
      tattooArtist: tattooArtist is _i3.TattooArtist?
          ? tattooArtist
          : this.tattooArtist?.copyWith(),
      workplaceId: workplaceId is int? ? workplaceId : this.workplaceId,
      workplace:
          workplace is _i4.Workplace? ? workplace : this.workplace?.copyWith(),
      tattooProjectId:
          tattooProjectId is int? ? tattooProjectId : this.tattooProjectId,
      tattooProject: tattooProject is _i5.TattooProject?
          ? tattooProject
          : this.tattooProject?.copyWith(),
      quotationId: quotationId is int? ? quotationId : this.quotationId,
      quotation:
          quotation is _i6.Quotation? ? quotation : this.quotation?.copyWith(),
      price: price ?? this.price,
      status: status ?? this.status,
    );
  }
}
