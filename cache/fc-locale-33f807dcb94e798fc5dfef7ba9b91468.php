<?php return array (
  'plugins.auth.ldap.displayName' => 'LDAP',
  'plugins.auth.ldap.description' => 'Plugin ini mengizinkan pengesahan dan sinkronisasi akun pengguna terhadap sumber data LDAP.',
  'plugins.auth.ldap.settings' => 'Pengaturan LDAP',
  'plugins.auth.ldap.settings.hostname' => 'Hostname Server',
  'plugins.auth.ldap.settings.hostname.description' => 'Contoh: "ldap.example.com", atau "ldaps://ldap.example.com" (untuk menggunakan SSL)',
  'plugins.auth.ldap.settings.port' => 'Server Port',
  'plugins.auth.ldap.settings.port.description' => 'Opsional. Default untuk 389 (LDAP) atau 636 (LDAP over SSL)',
  'plugins.auth.ldap.settings.basedn' => 'Base DN',
  'plugins.auth.ldap.settings.basedn.description' => 'Contoh:"ou=people,dc=example,dc=com"',
  'plugins.auth.ldap.settings.managerdn' => 'DN Manajer',
  'plugins.auth.ldap.settings.managerdn.description' => 'Contoh: "cn=Manager,dc=example,dc=com"',
  'plugins.auth.ldap.settings.managerpwd' => 'Kata Sandi Manajer',
  'plugins.auth.ldap.settings.managerpwd.description' => 'DN Manajer dan kata sandi hanya diperlukan jika sinkronisasi profil/kata sandi pengguna atau pilihan kreasi pengguna diaktifkan. Jika LDAP akan digunakan hanya untuk pengesahan, maka opsi ini dapat dihapus.',
  'plugins.auth.ldap.settings.uid' => 'Atribut Nama Akun',
  'plugins.auth.ldap.settings.uid.description' => 'Atribut yang nilanya secara unik mengidentifikasi obyek pengguna, seperti uid atau cn atau sAMAccountName.',
  'plugins.auth.ldap.settings.pwhash' => 'Enkripsi Kata Sandi',
  'plugins.auth.ldap.settings.pwhash.description' => 'Format hash untuk kata sandi disimpan di server. SSHA direkomendasikan (memerlukan PHP>=4.3.0.)',
  'plugins.auth.ldap.settings.saslopt' => 'Pengaturan SASL (opsional)',
  'plugins.auth.ldap.settings.sasl' => 'Gunakan SASL sebagai pengganti pengesahan yang sederhana (memerlukan PHP>=5)',
  'plugins.auth.ldap.settings.saslmech' => 'Mekanisme SASL',
  'plugins.auth.ldap.settings.saslmech.description' => 'Contoh: "DIGEST-MD5"',
  'plugins.auth.ldap.settings.saslrealm' => 'Jangkauan',
  'plugins.auth.ldap.settings.saslauthzid' => 'Memerlukan ID Pengesahan',
  'plugins.auth.ldap.settings.saslprop' => 'SASL Properti Keamanan',
); ?>