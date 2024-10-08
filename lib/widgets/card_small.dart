import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/classes/pictogram_utils.dart';
import 'package:app/classes/screen_messages.dart';
import 'package:app/classes/string_capitalize_extension.dart';
import 'package:app/data/pec.dart';
import 'package:app/models/pictograms.dart';
import 'package:flutter/material.dart';

class CardSmall extends StatelessWidget {

  CardSmall.fromPictogram(Pictograms pictogram, {super.key}) {
    Pec pecObj = PictogramUtils.toPec(pictogram);
    pec = pecObj;
    id = pecObj.id;
    title = pecObj.keywords;
    description = pecObj.description;
    imgUrl = PecsUrlBuilder().pictograms(pecObj.id.toString());
    categories = pecObj.categories;
    tags = pecObj.tags;
    tap = (){};
    //Update pecObj with the url was used to get the image from Arassac API
    pecObj.imgUrl = imgUrl!;
  }

  CardSmall(
      {
        super.key,
        this.id,
        this.title,
        this.description,
        this.imgUrl,
        this.tap,
        this.categories,
        this.pec,
       });

  dynamic id;
  String? description;
  String? imgUrl;
  Function? tap;
  String? title;
  String? categories;
  String? tags;
  Pec? pec;

  @override
  Widget build(BuildContext context) {
    var imageFromUrl = Image.network(imgUrl!, width: 150,);
    
    return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                description!,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              imageFromUrl,
                              Text(
                                title!.capitalize(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              // Text(
                              //   categories!,
                              //   style: Theme.of(context).textTheme.titleSmall,
                              // ),
                              // Text(
                              //   tags!,
                              //   style: Theme.of(context).textTheme.titleSmall,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Row(
                          children: [
                            // Icon(Icons.image_outlined),
                            // SizedBox(width: 8),
                            // Icon(Icons.check_circle_outline_outlined),
                            //IconsStacked(main: Icons.image_outlined, helper: Icons.check_circle_rounded),
                            // SizedBox(width: 8),
                            IconButton(
                                icon: const Icon(Icons.cloud_download_outlined),
                                onPressed: () => PecsImageProvider.updatePecAndSave(imgUrl!, id!.toString(), pec!, context, ScreenMessages.snackBarMessage("${pec!.keywords} guardado con exito!", context)),
                              ),
                            const SizedBox(width: 8),
                            const Icon(Icons.delete_outline_outlined),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.list_outlined),
                                                        
                            SizedBox(width: 8),
                            Icon(Icons.star_border_outlined),
                            
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}
