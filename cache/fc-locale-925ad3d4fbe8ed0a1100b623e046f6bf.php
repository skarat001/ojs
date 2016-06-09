<?php return array (
  'plugins.generic.sword.displayName' => 'Plugin SWORD',
  'plugins.generic.sword.description' => 'Memudahkan Manajer Jurnal dan (opsional) Penulis untuk menyimpan artikel melalui protokol SWORD',
  'plugins.generic.sword.enabled' => 'Plugin SWORD telah diaktifkan.',
  'plugins.generic.sword.disable' => 'Plugin SWORD telah dinon-aktifkan.',
  'plugins.generic.sword.settings' => 'Pengaturan',
  'plugins.generic.sword.settings.allowAuthorSpecify' => 'Memudahkan penulis untuk menspesifikasikan titik deposit.',
  'plugins.generic.sword.settings.depositPoints' => 'Titik Deposit',
  'plugins.generic.sword.depositPoints.create' => 'Buat Titik Deposit',
  'plugins.generic.sword.depositPoints.edit' => 'Edit Titik Deposit',
  'plugins.generic.sword.depositPoints.type.automatic' => 'Otomatis',
  'plugins.generic.sword.depositPoints.type.optionalSelection' => 'Opsional; Fleksibel',
  'plugins.generic.sword.depositPoints.type.optionalFixed' => 'Opsional; Pasti',
  'plugins.generic.sword.depositPoints.type.manager' => 'Hanya Manajer',
  'plugins.generic.sword.depositPoints.type.description' => '<h4>Tipe Titik Deposit:</h4>
<p><strong>Automatic</strong>: Deposit terjadi secara otomatis. Titik deposit SWORD penuh ditentukan. Username dan kata sandi harus ditentukan. Deposit terjadi setelah memberitahu penulis tentang penerimaan. <br/>
<strong>Opsional; Fleksibel</strong>: Penulis dapat memilih apakah akan menyimpan atau tidak. URL tertentu menunjukkan dokumen layanan, dan penulis bisa memilih titik deposi spesifik mana yang akan digunakan dari dokumen tersebut. Deposit terjadi setelah memberitahu penulis tentang penerimaan.<br/>
<strong>Opsional; Pasti</strong>: Penulis dapat memilih apakah akan menyimpan atau tidak. URL menentukan titik deposit SWORD. Deposit terjadi setelah memberitahu penulis tentang penerimaan.<br/>
<strong>Hanya Manajer</strong>: Hanya Manajer Jurnal boleh menggunakan titik deposit ini. URL menunjukkan dokumen layanan. Deposit secara manual dilakukan oleh Manajer Jurnal dengan menggunakan Import/Export interface dalam Manajemen Jurnal.
</p>',
  'plugins.generic.sword.depositPoints.password.description' => 'Jika Anda tidak menentukan kata sandi di sini, Anda dan/ atay penulis akan diberitahu saat deposit terjadi. Perhatikan, kata sandi akan tampak untuk semua Manajer Jurnal dan akan disimpan tidak dalam bentuk kode di database.',
  'plugins.generic.sword.depositPoints.name' => 'Nama',
  'plugins.generic.sword.automaticDepositComplete' => 'Item "{$itemTitle}" secara otomatis disimpan ke dalam repositori.  "{$repositoryName}".',
  'plugins.generic.sword.depositComplete' => 'Item "{$itemTitle}" disimpan ke dalam repositori "{$repositoryName}".',
  'plugins.generic.sword.authorDepositDescription' => '<p>Anda bisa secara opsional mengikuti formulir untuk menyimpan naskah Anda, "{$submissionTitle}", di salah satu repositori yang terdaftar. Gunakan checkboxes di bawah kolom sebelah kiri untuk memilih repositori mana yang Anda inginkan untuk menyimpan naskah; tiap repositori mungkin juga memudahkan Anda untuk menentukan titik deposit dari daftar pull-down.</p>',
  'plugins.generic.sword.authorCustomDepositDescription' => '<p>Anda bisa menentukan titik deposit SWORD-compliant di sistem berikut. Jika diinginkan, tentukan URL SWORD, username dan kata sandi ke repositori Anda dan naskah akan disimpan.</p>',
  'plugins.importexport.sword.displayName' => 'Plugin Deposit Impor/ Ekspor SWORD',
  'plugins.importexport.sword.description' => 'Simpan artikel di repositori tersendiri dengan menggunakan protokol deposit SWORD.',
  'plugins.importexport.sword.deposit' => 'Deposit',
  'plugins.importexport.sword.serviceDocUrl' => 'URL Dokumen Layanan',
  'plugins.importexport.sword.depositUrl' => 'URL Titik Deposit',
  'plugins.importexport.sword.depositPoint' => 'Titik Deposit',
  'plugins.importexport.sword.depositPoint.addRemove' => 'Tambah/Pindahkan',
  'plugins.importexport.sword.depositGalleys' => 'Deposit Galleys',
  'plugins.importexport.sword.depositEditorial' => 'Simpan File Editorial Terbaru',
  'plugins.importexport.sword.depositSuccessful' => 'Deposit Berhasil',
  'plugins.importexport.sword.depositSuccessfulDescription' => 'Item yang dipilih telah disimpan.',
  'plugins.importexport.sword.depositFailed' => 'Deposit Gagal',
); ?>