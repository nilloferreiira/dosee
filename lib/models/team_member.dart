class TeamMember {
  final String name;
  final String role;
  final String imageUrl;

  TeamMember({required this.name, required this.role, required this.imageUrl});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      name: json['name'] ?? json['title'] ?? '',
      role: json['role'] ?? json['description'] ?? '',
      imageUrl: json['image'] ?? json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'role': role,
    'image': imageUrl,
  };
}
