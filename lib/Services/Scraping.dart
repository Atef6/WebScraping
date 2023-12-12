import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:web_scraping/model/model.dart';

class Scraping {
  static List <Models>run(String html) {
    try {
      final soup = BeautifulSoup(html);
      final items = soup.findAll('div', class_: 'packages-item');
      List<Models> packages = [];
      for (var item in items) {
        final title = item.find('h3', class_: 'packages-title')?.text ?? '';
        final likes =
            item.find('div', class_: 'packages-score-value')?.text ?? '';
        final discraption =
            item.find('div', class_: 'packages-description')?.text ?? '';
        final version =
            item.findAll('span', class_: 'packages-metadata-block').first.text;
        final tags = item
            .findAll('a', class_: 'tag-badge-sub')
            .map((e) => e.text)
            .toList();
        Models model = Models(
          title: title,
          likes: likes,
          discraption: discraption,
          version: version,
          tags: tags,
        );
        packages.add(model);
      }
      return packages;
    } catch (e) {
      throw Exception(e);
    }
    return [];
  }
}
