<?php return array (
  'plugins.importexport.native.displayName' => 'Plugin XML Artikel & Terbitan',
  'plugins.importexport.native.description' => 'Impor dan ekspor artikel dan terbitan',
  'plugins.importexport.native.cliUsage' => 'Kegunaan: {$scriptName} {$pluginName} [command] ...
Perintah:
	impor [xmlFileName] [journal_path] [user_name] ...
	ekspor [xmlFileName] [journal_path] artikel [articleId1] [articleId2] ...
	ekspor [xmlFileName] [journal_path] artikel [articleId]
	ekspor [xmlFileName] [journal_path] terbitan [issueId1] [issueId2] ...
	ekspor [xmlFileName] [journal_path] terbitan [issueId]

Parameter tambahan diperlukan untuk mengimpor data seperti berikut ini, tergantung pada root node dokumen XML. 

Jika root node adalah <article> atau <articles>, parameter tambahan diperlukan.
Format di bawah ini diterima:

{$scriptName} {$pluginName} impor [xmlFileName] [journal_path] [user_name]
	id_terbitan [issueId] id_bagian [sectionId]

{$scriptName} {$pluginName} impor [xmlFileName] [journal_path] [user_name]
	id_terbitan [issueId] nama_bagian [name]

{$scriptName} {$pluginName} impor [xmlFileName] [journal_path]
	id_terbitan [issueId] singkatan_bagian [abbrev]',
  'plugins.importexport.native.export' => 'Ekspor Data',
  'plugins.importexport.native.export.issues' => 'Ekspor Terbitan',
  'plugins.importexport.native.export.sections' => 'Ekspor Bagian',
  'plugins.importexport.native.export.articles' => 'Ekspor Artikel',
  'plugins.importexport.native.selectIssue' => 'Pilih Terbitan',
  'plugins.importexport.native.selectArticle' => 'Pilih Artikel',
  'plugins.importexport.native.import.articles' => 'Impor Artikel',
  'plugins.importexport.native.import.articles.description' => 'File yang Anda impor berisi satu artikel atau lebih. Anda harus memilih satu terbitan dan bagian untuk mengimpor artikel-artikel ini ke dalamnya; jika Amda tidak ingin mengimpor artikel-artikel tersebut ke dalam terbitan dan bagian yang sama, Anda dapat memisahkan mereka ke dalam file XML yang berbeda atau memindahkan mereka ke dalam terbitan dan bagian yang tepat setelah mengimpor.',
  'plugins.importexport.native.import' => 'Impor Data',
  'plugins.importexport.native.import.description' => 'Plugin ini mendukung impor data berdasar pada native.dtd Definisi Tipe Dokumen. Root nodes yang didukung adalah &lt;article&gt;, &lt;articles&gt;, &lt;issue&gt;, and &lt;issues&gt;.',
  'plugins.importexport.native.import.error' => 'Impor Eror',
  'plugins.importexport.native.import.error.description' => 'Satu eror atau lebih terjadi selama impor. Cek untuk memastikan bahwa format file impor cocok dengan spesifikasi. Detail spesifik dari eror impor didaftar di bawah ini.',
  'plugins.importexport.native.cliError' => 'ERROR:',
  'plugins.importexport.native.error.uploadFailed' => 'Upload gagal; pastikan upload dibolehkan di server Anda dan file tidak begitu besar untuk PHP dan konfigurasi server web Anda.',
  'plugins.importexport.native.error.unknownUser' => 'Pengguna spesifik, "{$userName}", tidak ada.',
  'plugins.importexport.native.error.unknownJournal' => 'Jalan jurnal spesifik, "{$journalPath}", tidak ada.',
  'plugins.importexport.native.export.error.couldNotWrite' => 'Tidak dapat menulis pada file "{$fileName}".',
  'plugins.importexport.native.export.error.sectionNotFound' => 'Tidak ada bagian yang cocok dengan specifier "{$sectionIdentifier}".',
  'plugins.importexport.native.export.error.issueNotFound' => 'Tidak ada terbitan yang cocok dengan ID terbitan spesifik "{$issueId}".',
  'plugins.importexport.native.export.error.articleNotFound' => 'Tidak ada artikel yang cocok dengan ID artikel spesifik "{$articleId}".',
  'plugins.importexport.native.import.error.unsupportedRoot' => 'Plugin ini tidak mendukung root node yang tersedia "{$rootName}". Pastikan file ini dibentuk dengan benar dan coba lagi.',
  'plugins.importexport.native.import.error.titleMissing' => 'Judul untuk sebuah terbitan tidak ada.',
  'plugins.importexport.native.import.error.defaultTitle' => 'JUDUL TIDAK ADA',
  'plugins.importexport.native.import.error.unknownIdentificationType' => 'Tipe identifikasi tidak diketahui "{$identificationType}" dispesifikasikan di "identification" menghubungkan dengan elemen "issue" terbitan "{$issueTitle}".',
  'plugins.importexport.native.import.error.invalidBooleanValue' => 'Nilai boolean invalid "{$value}" ditentukan. Gunakan  "true" atau "false".',
  'plugins.importexport.native.import.error.invalidDate' => 'Data invalid date "{$value}" ditentukan.',
  'plugins.importexport.native.import.error.unknownEncoding' => 'Data dimasukkan dengan menggunakan tipe encoding yang tidak diketahui. "{$type}".',
  'plugins.importexport.native.import.error.couldNotWriteFile' => 'Tidak bisa menyimpan salinan lokal "{$originalName}".',
  'plugins.importexport.native.import.error.illegalUrl' => 'URL spesifik "{$url}" untuk terbitan "{$issueTitle}" ilegal. Impor yang diserahkan dari Web hanya mendukung metode http, https, ftp, atau ftps.',
  'plugins.importexport.native.import.error.unknownSuppFileType' => 'Tipe file tambahan yang tidak diketahui "{$suppFileType}" ditentukan.',
  'plugins.importexport.native.import.error.couldNotCopy' => 'URL spesifik "{$url}" tidak dapat disalin ke file lokal.',
  'plugins.importexport.native.import.error.duplicatePublicIssueId' => 'ID publik yang diberikan untuk terbitan impor "{$issueTitle}" sudah digunakan oleh terbitan lain, "{$otherIssueTitle}".',
  'plugins.importexport.native.import.error.sectionTitleMissing' => 'Judul bagian tidak ada untuk terbitan "{$issueTitle}". Pastikan dokumen XML sesuai dengan DTD yang tepat.',
  'plugins.importexport.native.import.error.sectionMismatch' => '"{$sectionTitle}" bagian dari terbitan "{$issueTitle}" cocok dengan bagian jurnal yang ada, tapi singkatan spesifik ("{$sectionAbbrev}") cocok dengan bagian yang berbeda.',
  'plugins.importexport.native.import.error.articleTitleMissing' => 'Judul artikel tidak ada untuk terbitan  "{$issueTitle}" di bagian "{$sectionTitle}". Pastikan dokumen XML sesuai dengan DTD yang tepat, dan judul telah disediakan untuk locale jurnal.',
  'plugins.importexport.native.import.error.articleTitleLocaleUnsupported' => 'Judul Artikel ("{$articleTitle}") disediakan untuk terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleAbstractLocaleUnsupported' => 'AAbstrak artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.galleyLabelMissing' => 'Artikel "{$articleTitle}" di bagian "{$sectionTitle}" terbitan "{$issueTitle}" melewatkan label galley.',
  'plugins.importexport.native.import.error.suppFileMissing' => 'Artikel "{$articleTitle}" di bagian "{$sectionTitle}" terbitan "{$issueTitle}" melewatkan file tambahan.',
  'plugins.importexport.native.import.error.galleyFileMissing' => 'Artikel "{$articleTitle}" di bagian "{$sectionTitle}" terbitan "{$issueTitle}" melewatkan file galley.',
  'plugins.importexport.native.import.error.issueTitleLocaleUnsupported' => 'Judul terbitan ("{$issueTitle}") disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.issueDescriptionLocaleUnsupported' => 'Deskripsi terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.coverLocaleUnsupported' => 'Sampul terbitan ini "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.sectionTitleLocaleUnsupported' => 'Judul bagian ("{$sectionTitle}") disediakan di terbitan "{$issueTitle}" di locale  ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.sectionAbbrevLocaleUnsupported' => 'Singkatan bagian ("{$sectionAbbrev}") disediakan di terbitan  ("{$issueTitle}") di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.sectionIdentifyTypeLocaleUnsupported' => 'Tipe mengidentifikasi bagian  ("{$sectionIdentifyType}") disediakan di terbitan  ("{$issueTitle}") di locale ("{$locale}")  yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.sectionPolicyLocaleUnsupported' => 'Kebijakan bagian ("{$sectionPolicy}") disediakan di terbitan ("{$issueTitle}") di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.sectionTitleMismatch' => 'Judul bagian "{$section1Title}" dan judul bagian "{$section2Title}" di terbitan "{$issueTitle}" cocok dengan bagian jurnal yang ada dan berbeda.',
  'plugins.importexport.native.import.error.sectionTitleMatch' => 'Judul bagian "{$sectionTitle}" di terbitan "{$issueTitle}" cocok dengan bagian jurnal yang ada, tapi judul lain dari bagian ini tidak cocok dengan judul lain dari bagian jurnal yang ada.',
  'plugins.importexport.native.import.error.sectionAbbrevMismatch' => 'Singkatan Bagian "{$section1Abbrev}" dan singkatan bagian "{$section2Abbrev}" dari terbitan "{$issueTitle}" cocok dengan bagian jurnal yang ada.',
  'plugins.importexport.native.import.error.sectionAbbrevMatch' => 'Singkatan bagian "{$sectionAbbrev}" di terbitan "{$issueTitle}" cocok dengan bagian jurnal yang ada, tapi singakatan lain dari bagian ini tidak cocok dengan singkatan lain dari bagian jurnal yang ada. .',
  'plugins.importexport.native.import.error.articleDisciplineLocaleUnsupported' => 'Disiplin artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleTypeLocaleUnsupported' => 'Tipe artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSubjectLocaleUnsupported' => 'Subjek artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSubjectClassLocaleUnsupported' => 'Kalsifikasi subjek artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleCoverageGeoLocaleUnsupported' => 'Cakupan geografis artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleCoverageChronLocaleUnsupported' => 'Cakupan kronologis artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleCoverageSampleLocaleUnsupported' => 'Cakupan sampel artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSponsorLocaleUnsupported' => 'Sponsor artikel disediakan untuk artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleAuthorCompetingInterestsLocaleUnsupported' => 'Minat bersaing penulis disediakan untuk penulis "{$authorFullName}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleAuthorBiographyLocaleUnsupported' => 'Biografi penulis disediakan untuk penulis "{$authorFullName}"  artikel "{$articleTitle}" di terbitan "{$issueTitle}" di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleAuthorAffiliationLocaleUnsupported' => 'Afiliasi penulis disediakan untuk penulis  "{$authorFullName}" artikel "{$articleTitle}" di terbitan "{$issueTitle}"di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.galleyLocaleUnsupported' => 'galley artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFileTitleLocaleUnsupported' => 'Judul file tambahan ("{$suppFileTitle}") artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFileCreatorLocaleUnsupported' => 'File tambahan pencipta "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") that this journal does not support.',
  'plugins.importexport.native.import.error.articleSuppFileSubjectLocaleUnsupported' => 'File tambahan subjek "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan  "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFileTypeOtherLocaleUnsupported' => 'File tambahan tipe biasa "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFileDescriptionLocaleUnsupported' => 'File tambahan deskripsi "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFilePublisherLocaleUnsupported' => 'File tambahan penerbit "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFileSponsorLocaleUnsupported' => 'ile tambahan sponsor "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.error.articleSuppFileSourceLocaleUnsupported' => 'File tambahan sumber "{$suppFileTitle}" artikel "{$articleTitle}" di terbitan "{$issueTitle}" disediakan di locale ("{$locale}") yang tidak didukung jurnal ini.',
  'plugins.importexport.native.import.success' => 'Impor Sukses',
  'plugins.importexport.native.import.success.description' => 'Impor telah sukses. Item yang telah diimpor dengan sukses ada di daftar berikut.',
); ?>