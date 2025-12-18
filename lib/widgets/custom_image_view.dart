// 🎯 Dart imports:
import 'dart:developer';
import 'dart:io' show File;

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

export '/gen/assets.gen.dart';

/// [CustomImageView]는 네트워크, 에셋, 파일, SVG 등 다양한 이미지 소스를 처리하며,
/// 이미지 로딩 실패 시 플레이스홀더 이미지를 표시하는 위젯입니다.
///
/// 이 위젯은 [imagePath]에 따라 적절한 위젯([SvgPicture.asset], [Image.file],
/// [CachedNetworkImage], [Image.asset])을 선택하여 이미지를 표시합니다.
/// 또한 [onTap], [alignment], [padding], [radius] 및 [border] 등의 파라미터를 통해
/// 터치 이벤트 처리 및 레이아웃 커스터마이징을 지원합니다.
class CustomImageView extends StatelessWidget {
  /// 생성자.
  ///
  /// [imagePath]는 표시할 이미지의 경로나 URL이며, [semanticLabel]은 시맨틱 설명으로 사용됩니다.
  /// [placeholder]는 이미지 로딩 실패 시 대체할 이미지 경로입니다.
  const CustomImageView({
    super.key,
    required this.imagePath,
    required this.semanticLabel,
    this.height,
    this.width,
    this.size,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.border = BorderSide.none,
    this.splashFactory = NoSplash.splashFactory,
    this.supportRtl = true,
    this.placeholder = 'assets/images/placeholder.png',
  }) : assert(!(size != null && (height != null || width != null)), 'Provide either size or height/width, not both');

  /// 표시할 이미지의 경로나 URL입니다.
  final String imagePath;

  /// 이미지에 대한 시맨틱 레이블입니다.
  final String semanticLabel;

  /// 이미지의 높이입니다.
  final double? height;

  /// 이미지의 너비입니다.
  final double? width;

  /// 이미지의 크기를 지정합니다. [size]가 지정된 경우 [height] 및 [width]는 무시됩니다.
  final double? size;

  /// 이미지에 적용할 색상입니다. (예: SVG 이미지에 색상 필터 적용)
  final Color? color;

  /// 이미지의 [BoxFit] 설정입니다.
  final BoxFit? fit;

  /// 이미지 로딩 실패 시 사용할 플레이스홀더 이미지의 경로입니다.
  final String placeholder;

  /// 이미지의 정렬 방식입니다.
  final Alignment? alignment;

  /// 이미지 탭 시 실행할 콜백 함수입니다.
  final VoidCallback? onTap;

  /// 이미지 모서리에 적용할 [BorderRadius]입니다.
  final BorderRadius radius;

  /// 위젯 외부 여백(Margin)으로, 내부 [Container]의 padding으로 사용됩니다.
  final EdgeInsetsGeometry padding;

  /// 이미지 테두리(Border) 스타일을 지정합니다.
  final BorderSide border;

  /// 위젯과 상호작용할 때 스플래시 효과의 모양을 정의합니다.
  final InteractiveInkFeatureFactory splashFactory;

  /// [TextDirection.rtl] 환경에서 이미지가 가로로 뒤집힐지 여부.
  final bool supportRtl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      child: ClipRRect(
        borderRadius: radius,
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: border,
          ),
          child: InkWell(
            splashFactory: splashFactory,
            onTap: onTap,
            child: SizedBox(
              height: size ?? height,
              width: size ?? width,
              child: _imageView,
            ),
          ),
        ),
      ),
    );
  }

  /// [imagePath]의 값에 따라 적절한 이미지 위젯을 생성하여 반환합니다.
  ///
  /// - [ImageType.svg]: [SvgPicture.asset]를 사용합니다.
  /// - [ImageType.file]: [Image.file]을 사용합니다.
  /// - [ImageType.network]: [CachedNetworkImage]를 사용합니다.
  /// - [ImageType.asset] 및 [ImageType.unknown]: [Image.asset]을 사용합니다.
  Widget get _imageView {
    switch (imagePath.imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          imagePath,
          semanticsLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.contain,
          matchTextDirection: supportRtl,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          errorBuilder: (context, Object error, StackTrace stackTrace) {
            return buildErrorWidget();
          },
        );
      case ImageType.file:
        return Image.file(
          File(imagePath),
          semanticLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.cover,
          color: color,
          matchTextDirection: supportRtl,
          errorBuilder: (context, Object error, StackTrace? stackTrace) {
            return buildErrorWidget();
          },
        );
      case ImageType.network:
        return Semantics(
          image: true,
          label: semanticLabel,
          child: CachedNetworkImage(
            height: size ?? height,
            width: size ?? width,
            fit: fit,
            imageUrl: imagePath,
            color: color,
            matchTextDirection: supportRtl,
            fadeOutDuration: const Duration(milliseconds: 500),
            placeholder: (BuildContext _, _) {
              return SizedBox.square(
                dimension: 30,
                child: LinearProgressIndicator(
                  color: Colors.grey.shade200,
                  backgroundColor: Colors.grey.shade100,
                  semanticsLabel: semanticLabel,
                ),
              );
            },
            errorWidget: (context, _, _) {
              return buildErrorWidget();
            },
            errorListener: (Object error) {
              const name = 'cached_network_image';
              if (error case HttpExceptionWithStatus(:final uri, :final message, :final statusCode)) {
                log('Error Message: $message', name: name);
                log('Error Image URL: $uri', name: name);
                log('Error Status Code : $statusCode', name: name);
              } else {
                log('Unknown Error Occurred', error: error, name: name);
              }
            },
          ),
        );
      case ImageType.asset:
      case ImageType.unknown:
        return Image.asset(
          imagePath,
          semanticLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.cover,
          color: color,
          matchTextDirection: supportRtl,
          errorBuilder: (context, Object error, StackTrace? stackTrace) {
            return buildErrorWidget();
          },
        );
    }
  }

  /// 이미지 로딩 실패 시 플레이스홀더 이미지를 반환하는 위젯을 빌드합니다.
  ///
  /// 플레이스홀더의 타입에 따라 [SvgPicture.asset] 또는 [Image.asset]을 사용합니다.
  Widget buildErrorWidget() {
    switch (placeholder.imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          placeholder,
          semanticsLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          matchTextDirection: supportRtl,
        );
      case ImageType.network:
        return Image.network(
          placeholder,
          semanticLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.cover,
          matchTextDirection: supportRtl,
        );
      case ImageType.file:
        return Image.file(
          File(placeholder),
          semanticLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.cover,
          matchTextDirection: supportRtl,
        );
      case ImageType.asset:
      case ImageType.unknown:
        return Image.asset(
          placeholder,
          semanticLabel: semanticLabel,
          height: size ?? height,
          width: size ?? width,
          fit: fit ?? BoxFit.cover,
          matchTextDirection: supportRtl,
        );
    }
  }
}

/// 문자열 확장을 통해 이미지 타입을 판단합니다.
///
/// imagePath의 접두사 또는 접미사를 기반으로 이미지의 유형을 반환합니다.
extension ImageTypeExtension on String {
  /// 이미지 타입을 반환합니다.
  @visibleForTesting
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else if (endsWith('.png') || endsWith('.jpg') || endsWith('.jpeg') || endsWith('.webp')) {
      return ImageType.asset;
    } else {
      return ImageType.unknown;
    }
  }
}

/// 지원하는 이미지 유형을 나타내는 열거형입니다.
enum ImageType { svg, asset, network, file, unknown }
