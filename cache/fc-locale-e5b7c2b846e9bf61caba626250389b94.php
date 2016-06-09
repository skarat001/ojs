<?php return array (
  'plugins.importexport.users.displayName' => 'Plugin Users XML',
  'plugins.importexport.users.description' => 'Impor dan ekspor pengguna',
  'plugins.importexport.users.cliUsage' => 'Penggunaan: {$scriptName} {$pluginName} [command] ...
Perintah:
	impor [xmlFileName] [journal_path] [optional flags]
	ekspor [xmlFileName] [journal_path]
	ekspor [xmlFileName] [journal_path] [role_path1] [role_path2] ...

Bendera Pilihan:
	continue_on_error: JIka ditentukan, tidak berhenti mengimpor pengguna jika terjadi kesalahan

	send_notify: Jika ditentukan, mengirim email notifikasi berisi nama pengguna dan kata kunci untuk mengimpor pengguna

Contoh:
	Impor pengguna kedalam myJournal dari myImportFile.xml, melanjutkan kesalahan:
	{$scriptName} {$pluginName} impor myImportFile.xml myJournal continue_on_error

	Ekspor semua pengguna dari myJournal:
	{$scriptName} {$pluginName} ekspor myExportFile.xml myJournal

	Ekspor semua pengguna yang terdaftar sebagai reviewer, bersama dengan peran mereka:
	{$scriptName} {$pluginName} ekspor myExportFile.xml myJournal reviewer',
  'plugins.importexport.users.import.importUsers' => 'Impor Pengguna',
  'plugins.importexport.users.import.instructions' => 'Pilih file data XML yang berisi informasi pengguna untuk impor kedalam jurnal ini. Lihat bantuan jurnal untuk lebih rinci tentang format file ini.<br /><br />Perhatikan bahwa file yang di impor berisi nama pengguna dan alamat email yang ada pada sistem, data pengguna untuk masing-masing pengguna tidak akan di impor dan setiap peran baru yang akan dibuat akan ditugaskan ke pengguna yang ada.',
  'plugins.importexport.users.import.failedToImportUser' => 'Gagal mengimpor pengguna',
  'plugins.importexport.users.import.failedToImportRole' => 'Gagal untuk menugaskan pengguna untuk peran',
  'plugins.importexport.users.import.dataFile' => 'File data pengguna',
  'plugins.importexport.users.import.sendNotify' => 'Mengirim email notofikasi untuk setiap pengguna yang di impor yang berisi nama pengguna dan kata kunci.',
  'plugins.importexport.users.import.continueOnError' => 'Lanjutkan impor pengguna lain jika terjadi kesalahan.',
  'plugins.importexport.users.import.noFileError' => 'Tidak ada file yang di unggah!',
  'plugins.importexport.users.import.usersWereImported' => 'Pengguna berikut ini berhasil di impor kedalam sistem',
  'plugins.importexport.users.import.errorsOccurred' => 'Terjadi kesalahan saat prose impor',
  'plugins.importexport.users.import.confirmUsers' => 'Konfirmasikan bahwa ini adalah pengguna yang Anda ingin mengimpor ke dalam sistem',
  'plugins.importexport.users.import.warning' => 'Peringatan',
  'plugins.importexport.users.import.encryptionMismatch' => 'Tidak dapat menggunakan hash kata kunci dengan {$importHash}; OJS dikonfigurasikan untuk menggunakan {$ojsHash}. Jika Anda melanjutkan, Anda harus memuat ulang kata kunci pengguna yang di impor',
  'plugins.importexport.users.unknownJournal' => 'Path jurnal tidak diketahui "{$journalPath}" dispesifikasikan.',
  'plugins.importexport.users.export.exportUsers' => 'Ekspor Pengguna',
  'plugins.importexport.users.export.exportByRole' => 'Ekspor berdasarkan Peran',
  'plugins.importexport.users.export.exportAllUsers' => 'Ekspor Semua',
  'plugins.importexport.users.export.errorsOccurred' => 'Terjadi kesalahan saat proses ekspor',
  'plugins.importexport.users.export.couldNotWriteFile' => 'Tidak bisa menulis ke file "{$fileName}".',
); ?>