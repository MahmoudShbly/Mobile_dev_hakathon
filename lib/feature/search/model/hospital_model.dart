class Hospital {
  final String name;
  final String location;
  final List<String> specialties;
  final String? imageUrl;
  final String? phone;

  const Hospital({
    required this.name,
    required this.location,
    required this.specialties,
    this.imageUrl,
    this.phone,
  });
}

const List<Hospital> searchHospitals = [
  Hospital(
    name: 'مركز المدينة الطبي',
    location: 'منطقة وسط المدينة',
    specialties: ['جلدية', 'عظمية', 'جراحة', 'باطنية'],
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBYme-B8BMo8unG7DDVzlrjvO56b2D82icFxt2dcnqS2uMCg3A617mjWW2gqVuQp0-Faq-ovrIq8Zc_quffEhjh6QIK_FOeVzCbuGpQ6TS9zzVnR5vyQL5OIakAQzGM1KtPTVtqZryWiCSpDBrjaZfIDZmfr3_Dj3QagWmIx-3Ze936LXr1f2ZWv7YT3jWllBS0Tu9WnF8hsJ6TlHczYyG7vzhrnLKYPUGke2MXhhDB3PZ9x4NNyZ0oteLQ0hbRzaEtUDydXJMIB6rO',
    phone: '+966501234567',
  ),
  Hospital(
    name: 'مستشفى سانت لوك التخصصي',
    location: 'ويست وينج بلازا',
    specialties: ['قلبية', 'أطفال', 'عيون'],
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBxNr_BJKJmS9_WI32jE68m2dL38WJ2eO5t0RNQ0c9GE6gbWs5IJG3XIoSUK4A0WDc5GCRgnVRoIo1resYhjXu7FC-8cFm2RVdg6K6FrYt3Jh_bm4xdDeav83gJNB3E8D1RE5FPZPh47kf91v88moeZMCaT6b_WcfW4beDvyPS1EOf3RkfUjJtjrdKUljQoPW6EbLtUkYc6OIiXVYZaPC9yhVwXGYGMNk5hlScmwhxQpzKnSdVNxS9qi6xo84QX1o_N1AsEpzWzr6Z6',
    phone: '+966502345678',
  ),
  Hospital(
    name: 'معهد الصحة العالمي',
    location: 'نورث هيل',
    specialties: ['أشعة', 'مسالك بولية', 'عام'],
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAgZgqkxW43W7y8l6oUoVHDXRskh5TUWTUxOKVjGrwXk6S_cHhbgosUXIqK0ZhdrFuxtK_0BR3mYY2SryIHuowS8O9fS-9OyeAN9ID98cC6eKNh7Nt9OMPAkEDGvO_2FGx5SSWiqX-aGpyYNYWR1OWO4VFV-CxMsrjyunzewcQ1ChcX9rasjjXwta3n-ySG6obVw4FgSxfANpN7pMfuEe0Mv1O_eX2Hi5t-xlYL45FJ4aQFCWoAvGkEj9HdHI3C6hyAlLWved8Ao_ex',
    phone: '+966503456789',
  ),
];
