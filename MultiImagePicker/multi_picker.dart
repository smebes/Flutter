    dynamic uploadMultipleImages(List<XFile> resultList) {
      if (mounted) {
        setState(() {
          extraImagesAsset.addAll(resultList);
          for(int i = 0; i < resultList.length ; i++){
            isSelectedExtraImagesPath.add(true);
            extraImagesId.add('');
          }
        });
      }
    }






Future<void> getMultipleImage() async {
    List<XFile> selectedImages;
    try {
      selectedImages = await _multiPicker.pickMultiImage();
      setState(() {});
    } catch (e) {
      e.toString();
    }
    if (!mounted) {
      return;
    }

    for(int i = 0; i < selectedImages.length; i++){ 
      if(selectedImages[i].name.contains('.webp')){
        showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(
              message: Utils.getString(context, 'error_dialog__webp_image'),
            );
          });
      return;
      } 
    } 
    if ((selectedImages.length + widget.extraImagesAsset.length) <= widget.maxImageCount - 10) {
      widget.uploadMultipleImages(selectedImages);
      imageList.addAll(selectedImages);
    } else {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(message: 'Maximum Image is ${widget.maxImageCount}');
        });
    }
  }
