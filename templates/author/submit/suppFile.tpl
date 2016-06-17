{**
	* templates/author/submit/suppFile.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Add/edit a supplementary file.
	*
	*}
	{assign var="pageTitle" value="author.submit.step4a"}
	{include file="author/submit/submitHeader.tpl"}

	<p><a href="{url op="submit" path=4 articleId=$articleId}">&lt;&lt; {translate key="author.submit.backToSupplementaryFiles"}</a></p>

	<form id="submit" method="post" action="{url op="saveSubmitSuppFile" path=$suppFileId}" enctype="multipart/form-data" class="form-horizontal">
		<input type="hidden" name="articleId" value="{$articleId|escape}" />
		{include file="common/formErrors.tpl"}

		{if count($formLocales) > 1}
		<div id="locale">
			<table width="100%" class="data">
				<tr valign="top">
					<td width="20%" class="">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
					<td width="80%" class="value">
						{url|assign:"submitFormUrl" path=$suppFileId articleId=$articleId escape=false}
						{form_language_chooser form="submit" url=$submitFormUrl}
						<span class="instruct">{translate key="form.formLanguage.description"}</span>
					</td>
				</tr>
			</table>
		</div>
		{/if}
		<div id="supplementaryFileData">
			<h3>{translate key="author.submit.supplementaryFileData"}</h3>

			<p>{translate key="author.submit.supplementaryFileDataDescription"}</p>
<div class="form-group">
			<div class="col-md-3 control-label">

			{fieldLabel required="true" name="title" key="common.title"}
</div>
			<div class="col-md-6">
			<input type="text" class="form-control" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="60" maxlength="255" />
	</div>
		</div>

<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="creator" key="author.submit.suppFile.createrOrOwner"}
</div>
			<div class="col-md-6">
			<input type="text" name="creator[{$formLocale|escape}]" class="form-control" id="creator" value="{$creator[$formLocale]|escape}" size="60" maxlength="255" />
	</div>
		</div>
<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="subject" key="common.keywords"}
</div>
			<div class="col-md-6">
			<input type="text" name="subject[{$formLocale|escape}]" class="form-control" id="subject" value="{$subject[$formLocale]|escape}" size="60" maxlength="255" />
	</div>
		</div>
<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="type" key="common.type"}
</div>
			<div class="col-md-6">
			<select name="type" id="type" size="1" class="form-control">{html_options_translate output=$typeOptionsOutput values=$typeOptionsValues translateValues="true" selected=$type}</select>
	</div>
		</div>

		<div class="form-group">
			<div class="col-md-3  col-md-offset-2 control-label">
				<label for="typeOther">{translate key="author.submit.suppFile.specifyOtherType"}</label>
</div>
			<div class="col-md-4">
				 <input type="text" name="typeOther[{$formLocale|escape}]" id="typeOther" class="form-control" value="{$typeOther[$formLocale]|escape}" size="45" maxlength="255" />
	</div>
		</div>

<div class="form-group">
			<div class="col-md-3 control-label">
				 {fieldLabel name="description" key="author.submit.suppFile.briefDescription"}
</div>
			<div class="col-md-6">
				 <textarea name="description[{$formLocale|escape}]" class="form-control" id="description" rows="5" cols="60">{$description[$formLocale]|escape}</textarea>
	</div>
		</div>

<div class="form-group">
			<div class="col-md-3 control-label">
				 {fieldLabel name="publisher" key="common.publisher"}
</div>
			<div class="col-md-6">
				 <input type="text" name="publisher[{$formLocale|escape}]" class="form-control" id="publisher" value="{$publisher[$formLocale]|escape}" size="60" maxlength="255" />
			<span class="instruct">{translate key="author.submit.suppFile.publisherDescription"}</span>

	</div>
		</div>

			<span class="instruct">{translate key="author.submit.suppFile.publisherDescription"}</span>


<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="sponsor" key="author.submit.suppFile.contributorOrSponsor"}
</div>
			<div class="col-md-6">
			<input type="text" name="sponsor[{$formLocale|escape}]" class="form-control" id="sponsor" value="{$sponsor[$formLocale]|escape}" size="60" maxlength="255" />

	</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="dateCreated" key="common.date"}
</div>
			<div class="col-md-6">
			<input type="text" name="dateCreated" class="form-control" id="dateCreated" value="{$dateCreated|escape}" size="11" maxlength="10" /> {translate key="submission.date.yyyymmdd"}
<span class="instruct">{translate key="author.submit.suppFile.dateDescription"}</span>
	</div>
		</div>
			

<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="source" key="common.source"}
</div>
			<div class="col-md-6">
			<input type="text" name="source[{$formLocale|escape}]" class="form-control" id="source" value="{$source[$formLocale]|escape}" size="60" maxlength="255" />
			<span class="instruct">{translate key="author.submit.suppFile.sourceDescription"}</span>
	</div>
		</div>

			

<div class="form-group">
			<div class="col-md-3 control-label">
			{fieldLabel name="language" key="common.language"}
</div>
			<div class="col-md-6">
			<input type="text" name="language" class="form-control" id="language" value="{$language|escape}" size="5" maxlength="10" />
			<span class="instruct">{translate key="author.submit.languageInstructions"}</span>
	</div>
		</div>
			



</div>
<div class="separator"></div>

{call_hook name="Templates::Author::Submit::SuppFile::AdditionalMetadata"}

<div id="supplementaryFileUpload">
	<h3>{translate key="author.submit.supplementaryFileUpload"}</h3>

	<table id="suppFile" class="data" width="100%">
		{if $suppFile && $suppFile->getFileId()}
		<tr valign="top">
			<td width="20%" class="">{translate key="common.fileName"}</td>
			<td width="80%" class="value"><a href="{url op="download" path=$articleId|to_array:$suppFile->getFileId()}">{$suppFile->getFileName()|escape}</a></td>
		</tr>
		<tr valign="top">
			<td width="20%" class="">{translate key="common.originalFileName"}</td>
			<td width="80%" class="value">{$suppFile->getOriginalFileName()|escape}</td>
		</tr>
		<tr valign="top">
			<td width="20%" class="">{translate key="common.fileSize"}</td>
			<td width="80%" class="value">{$suppFile->getNiceFileSize()}</td>
		</tr>
		<tr valign="top">
			<td width="20%" class="">{translate key="common.dateUploaded"}</td>
			<td width="80%" class="value">{$suppFile->getDateUploaded()|date_format:$datetimeFormatShort}</td>
		</tr>
	</table>
<br>
	<table id="showReviewers" class="data" width="100%">
		<tr valign="top">
			<td>&nbsp;</td>
			<td class="value"><input type="checkbox" name="showReviewers" id="showReviewers" value="1"{if $showReviewers==1} checked="checked"{/if} />
				<label for="showReviewers">{translate key="author.submit.suppFile.availableToPeers"}</label></td>
			</tr>
		</table>
		{else}
		<tr valign="top">
			<td colspan="2" class="nodata">{translate key="author.submit.suppFile.noFile"}</td>
		</tr>
	</table>
	{/if}

	<div class="separator"></div>
<div class="form-group">
			<div class="col-md-3 control-label">

				{if $suppFile && $suppFile->getFileId()}
				{fieldLabel name="uploadSuppFile" key="common.replaceFile"}
				{else}
				{fieldLabel name="uploadSuppFile" key="common.upload"}
				{/if}
				</div>
				<div class="col-md-6">
			<input type="file" name="uploadSuppFile" id="uploadSuppFile" class="uploadField" />&nbsp;&nbsp;
</div>
</div>
			{translate key="form.saveToUpload"}
	
		{if not ($suppFile && $suppFile->getFileId())}
		
		<input type="checkbox" name="showReviewers" id="showReviewers" value="1"{if $showReviewers==1} checked="checked"{/if} />&nbsp;
				<label for="showReviewers">{translate key="author.submit.suppFile.availableToPeers"}</label>

			{/if}
		
	</div>
	<div class="separator"></div>
	<div class="form-group">
<div class="col-md-5 col-md-offset-3">
	<p><input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="document.location.href='{url op="submit" path="4" articleId=$articleId escape=false}'" /></p>
</div>
</div>
	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/footer.tpl"}

