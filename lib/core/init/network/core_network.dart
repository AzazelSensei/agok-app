library core_network;

export 'package:dio/src/dio_mixin.dart';
export 'package:dio/src/form_data.dart';
export 'package:dio/src/multipart_file.dart';
export 'package:dio/src/options.dart';

// UTILS
export '../network/src/utils/request_type_extension.dart';
// INTERFACE

export '../network/src/interface/IErrorModel.dart';
export '../network/src/interface/INetworkModel.dart';
export '../network/src/interface/INetworkManager.dart';
export '../network/src/interface/IResponseModel.dart';
// MODEL
export '../network/src/model/empty_model.dart';
export '../network/src/enum/request_type.dart';
export '../network/src/model/error_model.dart';
export '../network/src/model/response_model.dart';
// NETWORK
export '../network/src/network_manager.dart';