String getAvatarWord(String name) {
  // Generate an avatar with initials from the contact's name
  final initials =
      name.split(' ').map((word) => word[0]).take(2).join().toUpperCase();
  return initials;
}
