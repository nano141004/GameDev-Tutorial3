### Referensi:
- https://youtu.be/NhHpDcpY8ok?si=XqqYQWdhuYnvOlCs  : tutorial for making double jump and dashing mechanic
- https://godotforums.org/d/35106-is-there-a-simple-solution-for-a-double-tap  : simple way to detect if a double tap occured, helps in making dashing mechanic
- https://www.youtube.com/watch?v=sVJEaYNOUNw&list=PLhXFaKLHQJdXpwaNt6gGwpHLTWL0m-TSL&index=2&ab_channel=KaanAlpar  : how to make animations, facing left/right based on input
- https://www.youtube.com/watch?v=Hpbn-w7H2V4&ab_channel=KaanAlpar  : tutorial for making crouching mechanic (animations too)

## Penjelesan pengerjaan implementasi fitur:
- **Fitur double jump: **
  
    Terdapat var `can_double_jump`, yang mulanya bernilai false, dan jika player menekan arrow up pertama kali dari landasan untuk melakukan jump, var `can_double_jump` akan menjadi true. Player dapat melakukan jump lagi jika menekan arrow up, dan setelah itu var `can_double_jump` akan menjadi false kembali(mencegah bisa lebih dari 2 kali jump).

- **Fitur dash:**
    
    Untuk melakukan dash, player harus terdeteksi menekan tombol arrow kiri 2 kali secara cepat, ataupun juga arrow kanan 2 kali secara cepat. Kemudian fitur dash akan aktif, dimana karakter player akan bergerak secara cepat ke kiri/kanan dalam beberapa waktu. Ide implementasi dengan membuat fungsi yang mendeteksi jika sebuah tombol arrow kiri/kanan ditekan 2 kali secara cepat, dan kemudian mengaktifkan mekanik dashing.

- **Fitur moving down:**
  
    Jika karakter player berada di udara, maka player dapat menekan arrow down untuk membuat karakter player turun lebih cepat - layaknya movement ke kiri/kanan biasa.

- **Fitur crouch:**

    Jika karakter player berada di tanah/landasan, dan player menekan tombol arrow down, maka karakter akan crouch (karakter menjadi lebih pendek). Implementasi dilakukan dengan membuat animasi dengan node AnimationPlayer, ada animasi idle/berdiri biasa dan ada juga animasi crouch. Kemudian terdapat implementasi kode untuk mengganti animasi yang sesuai.

- **Tambahan animasi:**
    
    Selain membuat animasi crouch, dibuat juga animasi idle, saat idle karakter terdapat animasi(sedikit pergerakan semacam bernafas, tidak hanya gambar static). Selain itu ada juga animasi disaat player menekan arrow kanan/bergerak ke kanan, karakter akan menghadap ke kanan, dan begitu juga sebaliknya untuk menghadap kiri. Ada juga animasi saat player berjalan, karakter player akan menjalankan animasi walk, dimana ada pergerakan karakter player seperti orang berjalan/berlari. Begitu juga saat crouch sambil bergerak ke kanan/kiri, ada juga animasi khusus.