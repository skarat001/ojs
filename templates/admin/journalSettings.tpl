{**
	* templates/admin/journalSettings.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Basic journal settings under site administration.
	*
	*}
	{strip}
	{assign var="pageTitle" value="admin.journals.journalSettings"}
	{include file="common/header.tpl"}
	{/strip}

	<br />

	<script type="text/javascript">
		{literal}
		<!--
// Ensure that the form submit button cannot be double-clicked
function doSubmit() {
	if (document.getElementById('journal').submitted.value != 1) {
		document.getElementById('journal').submitted.value = 1;
		document.getElementById('journal').submit();
	}
	return true;
}
// -->
{/literal}
</script>

<form id="journal" method="post" action="{url op="updateJournal"}" class="form-horizontal">
	<input type="hidden" name="submitted" value="0" />
	{if $journalId}
	<input type="hidden" name="journalId" value="{$journalId|escape}" />
	{/if}

	{include file="common/formErrors.tpl"}

	{if not $journalId}
	<p><span class="instruct">{translate key="admin.journals.createInstructions"}</span></p>
	{/if}


	{if count($formLocales) > 1}
	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="formLocale" key="form.formLanguage"}
		</div>
		<div class="col-md-7 col-sm-7">
			{url|assign:"settingsUrl" op="editJournal" path=$journalId escape=false}
			{form_language_chooser form="journal" url=$settingsUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</div>
	</div>

	{/if}
	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="title" key="manager.setup.journalTitle" required="true"}
		</div>
		<div class="col-md-7 col-sm-7">
			<input type="text" id="title" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" size="40" maxlength="120" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="description" key="admin.journals.journalDescription"}
		</div>
		<div class="col-md-7 col-sm-7">
			<textarea name="description[{$formLocale|escape}]" id="description" cols="40" rows="10" class="form-control">{$description[$formLocale]|escape}</textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="journalPath" key="journal.path" required="true"}
		</div>
		<div class="col-md-7 col-sm-7">
			<input type="text" id="journalPath" name="journalPath" value="{$journalPath|escape}" size="16" maxlength="32" class="form-control" />
			<br />
			{url|assign:"sampleUrl" journal="path"}
			<span class="instruct">{translate key="admin.journals.urlWillBe" sampleUrl=$sampleUrl}</span>
		</div>
	</div>
	<div class="form-group">
		<div class=" checkbox">
			<label for="enabled">
				<input type="checkbox" name="enabled" id="enabled" value="1"{if $enabled} checked="checked"{/if} /> {translate key="admin.journals.enableJournalInstructions"}</label>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-3 col-sm-offset-3">
				<p><input type="button" id="saveJournal" value="{translate key="common.save"}" class="btn btn-primary" onclick="doSubmit()" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="journals" escape=false}'" /></p>
			</div>
		</div>
	</form>

	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

	{include file="common/footer.tpl"}

