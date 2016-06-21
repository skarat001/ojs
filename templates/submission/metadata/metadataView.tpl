{**
 * metadata_view.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View (but not edit) metadata of an article. Used by MetadataForm.
 *
 *}
{strip}
{assign var="pageTitle" value="submission.viewMetadata"}
{include file="common/header.tpl"}
{/strip}

{if $canViewAuthors}
<div id="authors">
<h3>{translate key="article.authors"}</h3>
	

	{foreach name=authors from=$authors key=authorIndex item=author}
<div class="row">
<div class="col-md-3">
<strong>
{translate key="user.name"}
</strong>
</div>
<div class="col-md-6">
			{assign var=emailString value=$author.firstName|concat:" ":$author.middleName:" ":$author.lastName:" <":$author.email:">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl articleId=$articleId}
			{$author.firstName|escape} {$author.middleName|escape} {$author.lastName|escape} {icon name="mail" url=$url}
	</div>
	</div>

<div class="row">
<div class="col-md-3">
<strong>
	{translate key="user.url"}
</strong>
</div>
<div class="col-md-6">
	{$author.url|escape|default:"&mdash;"}
</div>
	</div>

	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="user.affiliation"}
</strong>
</div>
<div class="col-md-6">
	{$author.affiliation.$formLocale|escape|nl2br|default:"&mdash;"}

</div>
	</div>

	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="common.country"}
</strong>
</div>
<div class="col-md-6">
	{$author.countryLocalized|escape|default:"&mdash;"}
</div>
	</div>

	{if $currentJournal->getSetting('requireAuthorCompetingInterests')}
	
<div class="row">
<div class="col-md-3">
<strong>
			{url|assign:"competingInterestGuidelinesUrl" page="information" op="competingInterestGuidelines"}
			{translate key="author.competingInterests" competingInterestGuidelinesUrl=$competingInterestGuidelinesUrl}
		</strong>
</div>
<div class="col-md-6">

		{$author.competingInterests.$formLocale|strip_unsafe_html|nl2br|default:"&mdash;"}<
</div>
	</div>

	{/if}
	
	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="user.biography"}
	</strong>
</div>
<div class="col-md-6">
	{$author.biography.$formLocale|strip_unsafe_html|nl2br|default:"&mdash;"}
</div>
	</div>
	{if !$smarty.foreach.authors.last}
	

	{/if}
	{/foreach}


</div>

<div class="separator"></div>
{/if}

<div id="titleAndAbstract">
<h3>{translate key="submission.titleAndAbstract"}</h3>
<div class="row">
<div class="col-md-3">
<strong>
{translate key="article.title"}
</strong>
</div>
<div class="col-md-6">
{$title[$formLocale]|strip_unsafe_html|default:"&mdash;"}
</div>
	</div>
<div class="row">
<div class="col-md-3">
<strong>
{translate key="article.abstract"}
</strong>
</div>
<div class="col-md-6">
{$abstract[$formLocale]|strip_unsafe_html|nl2br|default:"&mdash;"}
</div>
	</div>
</div>
<div class="separator"></div>
<div id="cover">
<h3>{translate key="editor.article.cover"}</h3>

<div class="row">
<div class="col-md-3">
<strong>
{fieldLabel name="coverPage" key="editor.article.coverPage"}
</strong>
</div>
<div class="col-md-6">
{if $fileName[$formLocale]}<a href="javascript:openWindow('{$publicFilesDir}/{$fileName[$formLocale]|escape:"url"}');" class="file">{$originalFileName[$formLocale]}</a>{else}&mdash;{/if}
</div>
	</div>
<div class="row">
<div class="col-md-3">
<strong>
{fieldLabel name="coverPageAltText" key="common.altText"}
</strong>
</div>
<div class="col-md-6">
{$coverPageAltText[$formLocale]|escape}
</div>
	</div>
</div>
<div class="separator"></div>
<div id="indexing">
<h3>{translate key="submission.indexing"}</h3>
	

	{if $currentJournal->getSetting('metaDiscipline')}
	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.discipline"}
	</strong>
</div>
<div class="col-md-6">
	{$discipline[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>

	{/if}
	{if $currentJournal->getSetting('metaSubjectClass')}
	
	<a href="{$currentJournal->getLocalizedSetting('metaSubjectClassUrl')|escape}" target="_blank">{$currentJournal->getLocalizedSetting('metaSubjectClassTitle')|escape}</a>

<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.subjectClassification"}
</strong>
</div>
<div class="col-md-6">
	{$subjectClass[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>
	{/if}
	{if $currentJournal->getSetting('metaSubject')}
	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.subject"}
</strong>
</div>
<div class="col-md-6">
	{$subject[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>
	{/if}
	{if $currentJournal->getSetting('metaCoverage')}
	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.coverageGeo"}
</strong>
</div>
<div class="col-md-6">
	{$coverageGeo[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>

	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.coverageChron"}
</strong>
</div>
<div class="col-md-6">
	{$coverageChron[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>

	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.coverageSample"}
</strong>
</div>
<div class="col-md-6">
	{$coverageSample[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>
	{/if}
	{if $currentJournal->getSetting('metaType')}
	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.type"}
</strong>
</div>
<div class="col-md-6">
	{$type[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>
	{/if}
	<div class="row">
<div class="col-md-3">
<strong>
	{translate key="article.language"}
</strong>
</div>
<div class="col-md-6">
	{$language|escape|default:"&mdash;"}
</div>
	</div>
</div>

<div class="separator"></div>

<div id="supportingAgencies">
<h3>{translate key="submission.supportingAgencies"}</h3>
	
<div class="row">
<div class="col-md-3">
<strong>
	
	{translate key="submission.agencies"}
	</strong>
</div>
<div class="col-md-6">
	{$sponsor[$formLocale]|escape|default:"&mdash;"}
</div>
	</div>
</div>

{include file="common/footer.tpl"}

