
class Item {
  final int id;
  final String titel;
  final String image;
  final String location;
  final String description;
  final String rating;
  final String itinerary;
  final List category;

  Item({
    required this.id,
    required this.image,
    required this.titel,
    required this.location,
    required this.description,
    required this.rating,
    required this.itinerary,
    required this.category,
  });
}

List<Item> items = [
  Item(
    id: 0,
    image: 'images/1.jpg',
    titel: 'Núi fuji',
    location: 'Nhật bản',
    description:
        """Núi Phú Sĩ hay Núi Fuji (Phú Sĩ sơn (Fuji-san?)) nằm trên đảo Honshu là ngọn núi cao nhất Nhật Bản với độ cao 3.776,24 trên mực nước biển, là đỉnh núi cao thứ 2 trên một hòn đảo tại châu Á và thứ 7 trên thế giới. Đây là một núi lửa dạng tầng đã ngưng hoạt động với lần phun trào cuối vào năm 1707-1708.""",
    rating: '4.8',
    itinerary:
        """Núi Phú Sĩ là một trong "Tam linh sơn" ( San reizan, "ba ngọn núi linh thiêng") của Nhật Bản cùng với Núi Haku và Núi Tate. Núi Phú Sĩ là một danh thắng đặc biệt và một di tích lịch sử của Nhật Bản. Ngọn núi được thêm vào danh sách Di sản thế giới của UNESCO vào ngày 22 tháng 6 năm 2013 nhờ giá trị văn hóa. Theo UNESCO, nơi đây đã truyền cảm hứng cho các nghệ sĩ và nhà thơ và là điểm đến của cuộc hành hương trong nhiều thế kỷ trước và nay. Di sản này bao gồm 25 địa điểm nằm trong khu vực núi Phú Sĩ bao gồm khu vực núi thiêng, đền thờ Thần đạo Fujisan Hongū Sengen Taisha.""",
    category: [],
  )
];