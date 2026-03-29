// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VoiceState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isListening => throw _privateConstructorUsedError;
  bool get isSpeaking => throw _privateConstructorUsedError;
  bool get hasPermission => throw _privateConstructorUsedError;
  String? get recognizedText => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  SpeechStatus get speechStatus => throw _privateConstructorUsedError;
  TtsStatus get ttsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoiceStateCopyWith<VoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceStateCopyWith<$Res> {
  factory $VoiceStateCopyWith(
          VoiceState value, $Res Function(VoiceState) then) =
      _$VoiceStateCopyWithImpl<$Res, VoiceState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isListening,
      bool isSpeaking,
      bool hasPermission,
      String? recognizedText,
      String? error,
      SpeechStatus speechStatus,
      TtsStatus ttsStatus});
}

/// @nodoc
class _$VoiceStateCopyWithImpl<$Res, $Val extends VoiceState>
    implements $VoiceStateCopyWith<$Res> {
  _$VoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isListening = null,
    Object? isSpeaking = null,
    Object? hasPermission = null,
    Object? recognizedText = freezed,
    Object? error = freezed,
    Object? speechStatus = null,
    Object? ttsStatus = null,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpeaking: null == isSpeaking
          ? _value.isSpeaking
          : isSpeaking // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: freezed == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      speechStatus: null == speechStatus
          ? _value.speechStatus
          : speechStatus // ignore: cast_nullable_to_non_nullable
              as SpeechStatus,
      ttsStatus: null == ttsStatus
          ? _value.ttsStatus
          : ttsStatus // ignore: cast_nullable_to_non_nullable
              as TtsStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceStateImplCopyWith<$Res>
    implements $VoiceStateCopyWith<$Res> {
  factory _$$VoiceStateImplCopyWith(
          _$VoiceStateImpl value, $Res Function(_$VoiceStateImpl) then) =
      __$$VoiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isListening,
      bool isSpeaking,
      bool hasPermission,
      String? recognizedText,
      String? error,
      SpeechStatus speechStatus,
      TtsStatus ttsStatus});
}

/// @nodoc
class __$$VoiceStateImplCopyWithImpl<$Res>
    extends _$VoiceStateCopyWithImpl<$Res, _$VoiceStateImpl>
    implements _$$VoiceStateImplCopyWith<$Res> {
  __$$VoiceStateImplCopyWithImpl(
      _$VoiceStateImpl _value, $Res Function(_$VoiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isListening = null,
    Object? isSpeaking = null,
    Object? hasPermission = null,
    Object? recognizedText = freezed,
    Object? error = freezed,
    Object? speechStatus = null,
    Object? ttsStatus = null,
  }) {
    return _then(_$VoiceStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpeaking: null == isSpeaking
          ? _value.isSpeaking
          : isSpeaking // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: freezed == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      speechStatus: null == speechStatus
          ? _value.speechStatus
          : speechStatus // ignore: cast_nullable_to_non_nullable
              as SpeechStatus,
      ttsStatus: null == ttsStatus
          ? _value.ttsStatus
          : ttsStatus // ignore: cast_nullable_to_non_nullable
              as TtsStatus,
    ));
  }
}

/// @nodoc

class _$VoiceStateImpl implements _VoiceState {
  const _$VoiceStateImpl(
      {this.isInitialized = false,
      this.isListening = false,
      this.isSpeaking = false,
      this.hasPermission = false,
      this.recognizedText,
      this.error,
      this.speechStatus = SpeechStatus.idle,
      this.ttsStatus = TtsStatus.idle});

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isListening;
  @override
  @JsonKey()
  final bool isSpeaking;
  @override
  @JsonKey()
  final bool hasPermission;
  @override
  final String? recognizedText;
  @override
  final String? error;
  @override
  @JsonKey()
  final SpeechStatus speechStatus;
  @override
  @JsonKey()
  final TtsStatus ttsStatus;

  @override
  String toString() {
    return 'VoiceState(isInitialized: $isInitialized, isListening: $isListening, isSpeaking: $isSpeaking, hasPermission: $hasPermission, recognizedText: $recognizedText, error: $error, speechStatus: $speechStatus, ttsStatus: $ttsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isListening, isListening) ||
                other.isListening == isListening) &&
            (identical(other.isSpeaking, isSpeaking) ||
                other.isSpeaking == isSpeaking) &&
            (identical(other.hasPermission, hasPermission) ||
                other.hasPermission == hasPermission) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.speechStatus, speechStatus) ||
                other.speechStatus == speechStatus) &&
            (identical(other.ttsStatus, ttsStatus) ||
                other.ttsStatus == ttsStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInitialized,
      isListening,
      isSpeaking,
      hasPermission,
      recognizedText,
      error,
      speechStatus,
      ttsStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceStateImplCopyWith<_$VoiceStateImpl> get copyWith =>
      __$$VoiceStateImplCopyWithImpl<_$VoiceStateImpl>(this, _$identity);
}

abstract class _VoiceState implements VoiceState {
  const factory _VoiceState(
      {final bool isInitialized,
      final bool isListening,
      final bool isSpeaking,
      final bool hasPermission,
      final String? recognizedText,
      final String? error,
      final SpeechStatus speechStatus,
      final TtsStatus ttsStatus}) = _$VoiceStateImpl;

  @override
  bool get isInitialized;
  @override
  bool get isListening;
  @override
  bool get isSpeaking;
  @override
  bool get hasPermission;
  @override
  String? get recognizedText;
  @override
  String? get error;
  @override
  SpeechStatus get speechStatus;
  @override
  TtsStatus get ttsStatus;
  @override
  @JsonKey(ignore: true)
  _$$VoiceStateImplCopyWith<_$VoiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
