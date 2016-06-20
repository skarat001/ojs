{**
	* templates/submission/metadata/metadataEdit.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Form for changing metadata of an article (used in MetadataForm)
	*}
	{strip}
	{assign var="pageTitle" value="submission.editMetadata"}
	{include file="common/header.tpl"}
	{/strip}

	{url|assign:"competingInterestGuidelinesUrl" page="information" op="competingInterestGuidelines"}

	<form id="metadata" method="post" action="{url op="saveMetadata"}" enctype="multipart/form-data" class="form-horizontal">
		<input type="hidden" name="articleId" value="{$articleId|escape}" />
		{include file="common/formErrors.tpl"}

		{if $canViewAuthors}
		{literal}
		<script type="text/javascript">
			<!--
// Move author up/down
function moveAuthor(dir, authorIndex) {
	var form = document.getElementById('metadata');
	form.moveAuthor.value = 1;
	form.moveAuthorDir.value = dir;
	form.moveAuthorIndex.value = authorIndex;
	form.submit();
}
// -->
</script>
{/literal}

{if count($formLocales) > 1}
<div id="locales">

	{fieldLabel name="formLocale" key="form.formLanguage"}

	{url|assign:"formUrl" path=$articleId escape=false}
	{* Maintain localized author info across requests *}
	{foreach from=$authors key=authorIndex item=author}
	{if $currentJournal->getSetting('requireAuthorCompetingInterests')}
	{foreach from=$author.competingInterests key="thisLocale" item="thisCompetingInterests"}
	{if $thisLocale != $formLocale}

	<input type="hidden" name="authors[{$authorIndex|escape}][competingInterests][{$thisLocale|escape}]" value="{$thisCompetingInterests|escape}" />{/if}
	{/foreach}
	{/if}
	{foreach from=$author.biography key="thisLocale" item="thisBiography"}
	{if $thisLocale != $formLocale}

	<input type="hidden" name="authors[{$authorIndex|escape}][biography][{$thisLocale|escape}]" value="{$thisBiography|escape}" />{/if}

	{/foreach}
	{foreach from=$author.affiliation key="thisLocale" item="thisAffiliation"}
	{if $thisLocale != $formLocale}

	<input type="hidden" name="authors[{$authorIndex|escape}][affiliation][{$thisLocale|escape}]" value="{$thisAffiliation|escape}" />

	{/if}
	{/foreach}
	{/foreach}
	{form_language_chooser form="metadata" url=$formUrl}
	<span class="instruct">{translate key="form.formLanguage.description"}</span>


</locales>
{/if}

<div id="authors">

	<h3>{translate key="article.authors"}</h3>

	<input type="hidden" name="deletedAuthors" value="{$deletedAuthors|escape}" />
	<input type="hidden" name="moveAuthor" value="0" />
	<input type="hidden" name="moveAuthorDir" value="" />
	<input type="hidden" name="moveAuthorIndex" value="" />


	{foreach name=authors from=$authors key=authorIndex item=author}


	<input type="hidden" name="authors[{$authorIndex|escape}][authorId]" value="{$author.authorId|escape}" />

	<input type="hidden" name="authors[{$authorIndex|escape}][seq]" value="{$authorIndex+1}" />

	{if $smarty.foreach.authors.total <= 1}

	<input type="hidden" name="primaryContact" value="{$authorIndex|escape}" />
	{/if}

	<div class="form-group">
		<label class="col-md-3 control-label">

			{fieldLabel name="authors-$authorIndex-firstName" required="true" key="user.firstName"}
		</label>
		<div class="col-md-6">

			<input type="text" name="authors[{$authorIndex|escape}][firstName]" id="authors-{$authorIndex|escape}-firstName" value="{$author.firstName|escape}" size="20" maxlength="40" class="form-control" />

		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-middleName" key="user.middleName"}
		</label>
		<div class="col-md-6">
			<input type="text" name="authors[{$authorIndex|escape}][middleName]" id="authors-{$authorIndex|escape}-middleName" value="{$author.middleName|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>


	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-lastName" required="true" key="user.lastName"}
		</label>
		<div class="col-md-6">
			<input type="text" name="authors[{$authorIndex|escape}][lastName]" id="authors-{$authorIndex|escape}-lastName" value="{$author.lastName|escape}" size="20" maxlength="90" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-email" required="true" key="user.email"}
		</label>
		<div class="col-md-6">
			<input type="text" name="authors[{$authorIndex|escape}][email]" id="authors-{$authorIndex|escape}-email" value="{$author.email|escape}" size="30" maxlength="90" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-orcid" key="user.orcid"}
		</label>
		<div class="col-md-6">
			<input type="text" name="authors[{$authorIndex|escape}][orcid]" id="authors-{$authorIndex|escape}-orcid" value="{$author.orcid|escape}" size="30" maxlength="90" class="form-control" /><br />{translate key="user.orcid.description"}
		</div>
	</div>


	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-url" key="user.url"}
		</label>
		<div class="col-md-6">
			<input type="text" name="authors[{$authorIndex|escape}][url]" id="authors-{$authorIndex|escape}-url" value="{$author.url|escape}" size="30" maxlength="255" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-affiliation" key="user.affiliation"}
		</label>
		<div class="col-md-6">
			<textarea name="authors[{$authorIndex|escape}][affiliation][{$formLocale|escape}]" class="form-control" id="authors-{$authorIndex|escape}-affiliation" rows="5" cols="40">{$author.affiliation[$formLocale]|escape}</textarea><br/>
			<span class="instruct">{translate key="user.affiliation.description"}</span>
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-country" key="common.country"}
		</label>
		<div class="col-md-6">
			<select name="authors[{$authorIndex|escape}][country]" id="authors-{$authorIndex|escape}-country" class="selectMenu">
				<option value=""></option>
				{html_options options=$countries selected=$author.country|escape}
			</select>
		</div>
	</div>

	{if $currentJournal->getSetting('requireAuthorCompetingInterests')}
	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-competingInterests" key="author.competingInterests" competingInterestGuidelinesUrl=$competingInterestGuidelinesUrl}
		</label>
		<div class="col-md-6">
			<textarea name="authors[{$authorIndex|escape}][competingInterests][{$formLocale|escape}]" class="form-control" id="authors-{$authorIndex|escape}-competingInterests" rows="5" cols="40">{$author.competingInterests[$formLocale]|escape}</textarea>
		</div>
	</div>
	{/if}{* requireAuthorCompetingInterests *}

	<div class="form-group">
		<label class="col-md-3 control-label">
			{fieldLabel name="authors-$authorIndex-biography" key="user.biography"}<br />{translate key="user.biography.description"}
		</label>
		<div class="col-md-6">
			<textarea name="authors[{$authorIndex|escape}][biography][{$formLocale|escape}]" id="authors-{$authorIndex|escape}-biography" rows="5" cols="40" class="form-control">{$author.biography[$formLocale]|escape}</textarea>
		</div>
	</div>
	{call_hook name="Templates::Submission::MetadataEdit::Authors"}

	{if $smarty.foreach.authors.total > 1}
	<div class="form-group">
		<label class="col-md-3 control-label">
			{translate key="author.submit.reorder"}
		</label>
		<div class="col-md-6">
			<a href="javascript:moveAuthor('u', '{$authorIndex|escape}')" class="action plain">&uarr;</a> <a href="javascript:moveAuthor('d', '{$authorIndex|escape}')" class="action plain">&darr;</a>

			<label for="primaryContact-{$authorIndex|escape}">
				<input type="radio" name="primaryContact" id="primaryContact-{$authorIndex|escape}" value="{$authorIndex|escape}"{if $primaryContact == $authorIndex} checked="checked"{/if} /> {translate key="author.submit.selectPrincipalContact"}</label>
			</div>
		</div>

		<div class="form-group ">
			<div class="col-md-6 col-md-offset-3">
				<input type="submit" name="delAuthor[{$authorIndex|escape}]" value="{translate key="author.submit.deleteAuthor"}" class="btn btn-default" />
			</div>
		</div>
		{/if}
		{if !$smarty.foreach.authors.last}

		{/if}

		{foreachelse}
		<input type="hidden" name="authors[0][authorId]" value="0" />
		<input type="hidden" name="primaryContact" value="0" />
		<input type="hidden" name="authors[0][seq]" value="1" />

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-firstName" required="true" key="user.firstName"}
			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][firstName]" id="authors-0-firstName" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-middleName" key="user.middleName"}
			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][middleName]" id="authors-0-middleName" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-lastName" required="true" key="user.lastName"}
			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][lastName]" id="authors-0-lastName" size="20" maxlength="90" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-email" required="true" key="user.email"}
			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][email]" id="authors-0-email" size="30" maxlength="90" class="form-control" />
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-url" key="user.url"}
			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][url]" id="authors-0-url" size="30" maxlength="255" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-affiliation" key="user.affiliation"}
			</label>
			<div class="col-md-6">
				<textarea name="authors[0][affiliation][{$formLocale|escape}]" class="form-control" id="authors-0-affiliation" rows="5" cols="40"></textarea><br/>
				<span class="instruct">{translate key="user.affiliation.description"}</span>
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-$authorIndex-country" key="common.country"}
			</label>
			<div class="col-md-6">
				<select name="authors[0][country]" id="authors-0-country" class="selectMenu">
					<option value=""></option>
					{html_options options=$countries}
				</select>
			</div>
		</div>

		{if $currentJournal->getSetting('requireAuthorCompetingInterests')}

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-competingInterests" key="author.competingInterests" competingInterestGuidelinesUrl=$competingInterestGuidelinesUrl}
			</label>
			<div class="col-md-6">
				<textarea name="authors[0][competingInterests][{$formLocale|escape}]" class="form-control" id="authors-0-competingInterests" rows="5" cols="40"></textarea>
			</div>
		</div>
		{/if}

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="authors-0-biography" key="user.biography"}<br />{translate key="user.biography.description"}
			</label>
			<div class="col-md-6">
				<textarea name="authors[0][biography][{$formLocale|escape}]" id="authors-0-biography" rows="5" cols="40" class="form-control"></textarea>
			</div>
		</div>
		{/foreach}

		<div class="form-group ">
			<div class="col-md-6 col-md-offset-3">
				<p><input type="submit" class="btn btn-default" name="addAuthor" value="{translate key="author.submit.addAuthor"}" /></p>
			</div>
		</div>
	</div>

	<div class="separator"></div>
	{/if}

	<div id="titleAndAbstract">
		<h3>{translate key="submission.titleAndAbstract"}</h3>
	<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="title" required="true" key="article.title"}
			</label>
			<div class="col-md-6">
		<input type="text" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="60" class="form-control" />
			</div>
		</div>

	<div class="form-group">
			<label class="col-md-3 control-label">
		{if $section && $section->getAbstractsNotRequired()==0}{fieldLabel name="abstract" required="true" key="article.abstract"}{else}{fieldLabel name="abstract" key="article.abstract"}{/if}
			</label>
			<div class="col-md-6">
		<textarea name="abstract[{$formLocale|escape}]" id="abstract" rows="15" cols="60" class="form-control">{$abstract[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="cover">
		<h3>{translate key="editor.article.cover"}</h3>

		<input type="hidden" name="fileName[{$formLocale|escape}]" value="{$fileName[$formLocale]|escape}" />
		<input type="hidden" name="originalFileName[{$formLocale|escape}]" value="{$originalFileName[$formLocale]|escape}" />


	<div class="form-group">
			<div class="col-md-6 checkbox">
			 <label for="showCoverPage">
		<input type="checkbox" name="showCoverPage[{$formLocale|escape}]" id="showCoverPage" value="1" {if $showCoverPage[$formLocale]} checked="checked"{/if} />{translate key="editor.article.showCoverPage"}</label>

			</div>
		</div>

			<div class="form-group">
			<label class="col-md-3 control-label">

		{fieldLabel name="coverPage" key="editor.article.coverPage"}
			</label>
			<div class="col-md-6">
		<input type="file" name="coverPage" id="coverPage" class="form-control" />&nbsp;&nbsp;{translate key="form.saveToUpload"}<br />{translate key="editor.article.coverPageInstructions"}<br />{translate key="editor.article.uploaded"}:&nbsp;{if $fileName[$formLocale]}<a href="javascript:openWindow('{$publicFilesDir}/{$fileName[$formLocale]|escape:"url"}');" class="file">{$originalFileName[$formLocale]}</a>&nbsp;<a href="{url op="removeArticleCoverPage" path=$articleId|to_array:$formLocale}" onclick="return confirm('{translate|escape:"jsparam" key="editor.article.removeCoverPage"}')">{translate key="editor.article.remove"}</a>{else}&mdash;{/if}
			</div>
		</div>


			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="coverPageAltText" key="common.altText"}
			</label>
			<div class="col-md-6">
		<input type="text" name="coverPageAltText[{$formLocale|escape}]" value="{$coverPageAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />

		<span class="instruct">{translate key="common.altTextInstructions"}</span>
			</div>
		</div>


			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="hideCoverPageToc" key="editor.article.coverPageDisplay"}
			</label>
			<div class="col-md-6 checkbox">
			<label for="hideCoverPageToc">
		<input type="checkbox" name="hideCoverPageToc[{$formLocale|escape}]" id="hideCoverPageToc" value="1" {if $hideCoverPageToc[$formLocale]} checked="checked"{/if} /> {translate key="editor.article.hideCoverPageToc"}</label>
<label for="hideCoverPageAbstract">
		<input type="checkbox" name="hideCoverPageAbstract[{$formLocale|escape}]" id="hideCoverPageAbstract" value="1" {if $hideCoverPageAbstract[$formLocale]} checked="checked"{/if} /> {translate key="editor.article.hideCoverPageAbstract"}</label>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="indexing">
		<h3>{translate key="submission.indexing"}</h3>

		{if $journalSettings.metaDiscipline || $journalSettings.metaSubjectClass || $journalSettings.metaSubject || $journalSettings.metaCoverage || $journalSettings.metaType}<p>{translate key="author.submit.submissionIndexingDescription"}</p>{/if}


		{if $journalSettings.metaDiscipline}
		
			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="discipline" key="article.discipline"}
			</label>
			<div class="col-md-6">
		<input type="text" name="discipline[{$formLocale|escape}]" id="discipline" value="{$discipline[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		{if $currentJournal->getLocalizedSetting('metaDisciplineExamples') != ''}
		<br />
		<span class="instruct">{$currentJournal->getLocalizedSetting('metaDisciplineExamples')|escape}</span>
					</div>
		</div>
		{/if}

		{/if}
		{if $journalSettings.metaSubjectClass}
		
		<a href="{$currentJournal->getLocalizedSetting('metaSubjectClassUrl')|escape}" target="_blank">{$currentJournal->getLocalizedSetting('metaSubjectClassTitle')|escape}</a>

	<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="subjectClass" key="article.subjectClassification"}
			</label>
			<div class="col-md-6">
		<input type="text" name="subjectClass[{$formLocale|escape}]" id="subjectClass" value="{$subjectClass[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		<br />
		<span class="instruct">{translate key="author.submit.subjectClassInstructions"}</span>
					</div>
		</div>
		{/if}
		{if $journalSettings.metaSubject}
		

			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="subject" key="article.subject"}
			</label>
			<div class="col-md-6">
		<input type="text" name="subject[{$formLocale|escape}]" id="subject" value="{$subject[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		{if $currentJournal->getLocalizedSetting('metaSubjectExamples') != ''}
		<br />
		<span class="instruct">{$currentJournal->getLocalizedSetting('metaSubjectExamples')|escape}</span>
		{/if}
			</div>
		</div>

		{/if}
		{if $journalSettings.metaCoverage}
		
			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="coverageGeo" key="article.coverageGeo"}
			</label>
			<div class="col-md-6">
		<input type="text" name="coverageGeo[{$formLocale|escape}]" id="coverageGeo" value="{$coverageGeo[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		{if $currentJournal->getLocalizedSetting('metaCoverageGeoExamples') != ''}
		<br />
		<span class="instruct">{$currentJournal->getLocalizedSetting('metaCoverageGeoExamples')|escape}</span>
		{/if}
			</div>
		</div>


	<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="coverageChron" key="article.coverageChron"}
			</label>
			<div class="col-md-6">
		<input type="text" name="coverageChron[{$formLocale|escape}]" id="coverageChron" value="{$coverageChron[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		{if $currentJournal->getLocalizedSetting('metaCoverageChronExamples') != ''}
		<br />
		<span class="instruct">{$currentJournal->getLocalizedSetting('metaCoverageChronExamples')|escape}</span>
		{/if}
					</div>
		</div>


	<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="coverageSample" key="article.coverageSample"}
			</label>
			<div class="col-md-6">
		<input type="text" name="coverageSample[{$formLocale|escape}]" id="coverageSample" value="{$coverageSample[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		{if $currentJournal->getLocalizedSetting('metaCoverageResearchSampleExamples') != ''}
		<br />
		<span class="instruct">{$currentJournal->getLocalizedSetting('metaCoverageResearchSampleExamples')|escape}</span>
		{/if}
			</div>
		</div>

		{/if}
		{if $journalSettings.metaType}
		

			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="type" key="article.type"}
			</label>
			<div class="col-md-6">
		<input type="text" name="type[{$formLocale|escape}]" id="type" value="{$type[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
			</div>
		</div>

		{/if}
		
			<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="language" key="article.language"}
			</label>
			<div class="col-md-6">
		<input type="text" name="language" id="language" value="{$language|escape}" size="5" maxlength="10" class="form-control" />
		<br />
		<span class="instruct">{translate key="author.submit.languageInstructions"}</span>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="supportingAgencies">

		<h3>{translate key="submission.supportingAgencies"}</h3>

		<p>{translate key="author.submit.submissionSupportingAgenciesDescription"}</p>

	<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="sponsor" key="submission.agencies"}
			</label>
			<div class="col-md-6">
		<input type="text" name="sponsor[{$formLocale|escape}]" id="sponsor" value="{$sponsor[$formLocale]|escape}" size="60" maxlength="255" class="form-control" />

			</div>
		</div>
	</div>

	<div class="separator"></div>

	{foreach from=$pubIdPlugins item=pubIdPlugin}
	{assign var=pubIdMetadataFile value=$pubIdPlugin->getPubIdMetadataFile()}
	{include file="$pubIdMetadataFile" pubObject=$article}
	{/foreach}

	{call_hook name="Templates::Submission::MetadataEdit::AdditionalMetadata"}

	{if $journalSettings.metaCitations}
	<div id="metaCitations">
		<h3>{translate key="submission.citations"}</h3>

		<p>{translate key="author.submit.submissionCitations"}</p>

	<div class="form-group">
			<label class="col-md-3 control-label">
		{fieldLabel name="citations" key="submission.citations"}
					</label>
			<div class="col-md-6">
		<textarea name="citations" id="citations" class="form-control" rows="15" cols="60">{$citations|escape}</textarea>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	// Display warning when citations are being changed.
	$(function() {ldelim}
		$('#citations').change(function(e) {ldelim}
			var $this = $(this);
			var originalContent = $this.text();
			var newContent = $this.val();
			if(originalContent != newContent) {ldelim}
				// Display confirm message.
			if (!confirm('{translate key="submission.citations.metadata.changeWarning"}')) {ldelim}
				$this.val(originalContent);
			{rdelim}
			{rdelim}
			{rdelim});
		{rdelim});
</script>
<div class="separator"></div>
{/if}

{if $isEditor}
<div id="display">
	<h3>{translate key="editor.article.display"}</h3>

	<div class="form-group">
			<label class="col-md-3 control-label">	
	{fieldLabel name="hideAuthor" key="issue.toc"}
			</label>
			<div class="col-md-6">
	{translate key="editor.article.hideTocAuthorDescription"}:
				<select name="hideAuthor" id="hideAuthor" class="selectMenu">
					{html_options options=$hideAuthorOptions selected=$hideAuthor|escape}
				</select>
						</div>
		</div>
</div>

<div id="permissions">
	<h3>{translate key="submission.permissions"}</h3>
		<div class="form-group">
			<label class="col-md-3 control-label">
	{fieldLabel name="copyrightHolder" key="submission.copyrightHolder"}
			</label>
			<div class="col-md-6">
	<input type="text" name="copyrightHolder[{$formLocale|escape}]" id="copyrightHolder" value="{$copyrightHolder[$formLocale]|escape}" size="60" maxlength="255" class="form-control" />
			</div>
		</div>


	<div class="form-group">
			<label class="col-md-3 control-label">
	{fieldLabel name="copyrightYear" key="submission.copyrightYear"}
			</label>
			<div class="col-md-6">
	<input type="text" name="copyrightYear" id="copyrightYear" value="{$copyrightYear|escape}" size="10" maxlength="255" class="form-control" />
			</div>
		</div>

			<div class="form-group">
			<label class="col-md-3 control-label">
	{fieldLabel name="licenseURL" key="submission.licenseURL"}<
			</label>
			<div class="col-md-6">
	<input type="text" name="licenseURL" id="licenseURL" value="{$licenseURL|escape}" size="60" maxlength="255" class="form-control" />
			</div>
		</div>
</div>

<div class="separator"></div>

{/if}{* $isEditor *}

<div class="form-group ">
<div class="col-md-6 col-md-offset-3">
<p><input type="submit" value="{translate key="submission.saveMetadata"}" class="btn btn-primary"/> <input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="history.go(-1)" /></p>
			</div>
		</div>
<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/footer.tpl"}

