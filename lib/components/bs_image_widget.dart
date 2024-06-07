import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bs_image_model.dart';
export 'bs_image_model.dart';

class BsImageWidget extends StatefulWidget {
  const BsImageWidget({
    super.key,
    this.imageParam,
  });

  final FFUploadedFile? imageParam;

  @override
  State<BsImageWidget> createState() => _BsImageWidgetState();
}

class _BsImageWidgetState extends State<BsImageWidget> {
  late BsImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BsImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302.0,
      height: 299.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.memory(
              widget.imageParam?.bytes ?? Uint8List.fromList([]),
              width: 300.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
