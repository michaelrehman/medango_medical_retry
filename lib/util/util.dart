import 'package:medango_medical_retry/widgets/details_list.dart'
    show DetailsEntry, DeleteDetailsEntry;

DetailsEntry composeDetailsEntry(DeleteDetailsEntry onDelete,
    [Map<String, String> data]) {
  return DetailsEntry(
    title: data['title'],
    subtitle: data['subtitle'],
    onDelete: onDelete,
  ); // DetailsEntry
}
