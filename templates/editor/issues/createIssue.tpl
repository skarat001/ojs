{**
	* templates/editor/issues/createIssue.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Form for creation of an issue
	*
	*}
	{strip}
	{assign var="pageTitle" value="editor.issues.createIssue"}
	{url|assign:"currentUrl" page="editor" op="createIssue"}
	{include file="common/header.tpl"}
	{/strip}

	{include file="common/formErrors.tpl"}
	<ul class="nav nav-pills">
		<li class="nav-item active"><a href="{url op="createIssue"}" class="nav-link">{translate key="editor.navigation.createIssue"}</a></li>
		<li class="nav-item "><a href="{url op="futureIssues"}" class="nav-link">{translate key="editor.navigation.futureIssues"}</a></li>
		<li class="nav-item "><a href="{url op="backIssues"}" class="nav-link">{translate key="editor.navigation.issueArchive"}</a></li>
	</ul>
	<hr>

	<form action="#" class="form-horizontal">

		<div class="row form-group" >
			<div class="col-md-3 control-label">

				{translate key="issue.issue"}

			</div>
			<div class="col-md-5">
				<select name="issue" class="form-control" onchange="if(this.options[this.selectedIndex].value > 0) location.href='{url|escape:"javascript" op="issueToc" path="ISSUE_ID" escape=false}'.replace('ISSUE_ID', this.options[this.selectedIndex].value)" size="1">{html_options options=$issueOptions selected=$issueId}</select>
			</div>
		</div>
	</form>

	<form id="issue" method="post" action="{url op="saveIssue"}" enctype="multipart/form-data" class="form-horizontal">

		<div class="separator"></div>
		<div id="identification">
			<h3>{translate key="editor.issues.identification"}</h3>


			{if count($formLocales) > 1}
			<div class="form-group">
				<div class="col-md-3 control-label">
					{fieldLabel name="formLocale" key="form.formLanguage"}
				</div>
				<div class="col-md-5">
					{url|assign:"issueUrl" op="createIssue" escape=false}
					{form_language_chooser form="issue" url=$issueUrl}
					<span class="instruct">{translate key="form.formLanguage.description"}</span>

				</div>
			</div>
			{/if}
			<div class="form-group">
				<div class="col-md-3 control-label">
					{fieldLabel name="volume" key="issue.volume"}
				</div>
				<div class="col-md-5">
					<input type="text" name="volume" id="volume" value="{$volume|escape}" size="5" maxlength="5" class="form-control" />
				</div>
			</div>

			<div class="form-group ">
				<div class="col-md-3 control-label">
					{fieldLabel name="number" key="issue.number"}
				</div>
				<div class="col-md-5">
					<input type="text" name="number" id="number" value="{$number|escape}" size="5" maxlength="5" class="form-control" />
				</div>
			</div>

			<div class="form-group ">
				<div class="col-md-3  control-label">
					{fieldLabel name="year" key="issue.year"}
				</div>
				<div class="col-md-5">
					<input type="text" name="year" id="year" value="{$year|escape}" size="5" maxlength="4" class="form-control" />
				</div>
			</div>


			<div class="form-group ">
				<div class="col-md-3  control-label">
					{fieldLabel suppressId="true" name="labelFormat" key="editor.issues.issueIdentification"}</td>
				</div>
				<div class="col-md-5">
					<input type="checkbox" name="showVolume" id="showVolume" value="1"{if $showVolume} checked="checked"{/if} /><label for="showVolume"> {translate key="issue.volume"}</label><br /><input type="checkbox" name="showNumber" id="showNumber" value="1"{if $showNumber} checked="checked"{/if} /><label for="showNumber"> {translate key="issue.number"}</label><br /><input type="checkbox" name="showYear" id="showYear" value="1"{if $showYear} checked="checked"{/if} /><label for="showYear"> {translate key="issue.year"}</label><br /><input type="checkbox" name="showTitle" id="showTitle" value="1"{if $showTitle} checked="checked"{/if} /><label for="showTitle"> {translate key="issue.title"}</label>
				</div>
			</div>

			{if $enablePublicIssueId}
			<div class="form-group ">
				<div class="col-md-3  control-label">
					{fieldLabel name="publicIssueId" key="editor.issues.publicIssueIdentifier"}
				</div>
				<div class="col-md-5">
					<input type="text" name="publicIssueId" id="publicIssueId" value="{$publicIssueId|escape}" size="20" maxlength="255" class="form-control" />
				</div>
			</div>
			{/if}
			<div class="form-group ">
				<div class="col-md-3  control-label">
					{fieldLabel name="title" key="issue.title"}
				</div>
				<div class="col-md-5">
					<input type="text" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="40" class="form-control" />
				</div>
			</div>

			<div class="form-group ">
				<div class="col-md-3  control-label">
					{fieldLabel name="description" key="editor.issues.description"}
				</div>
				<div class="col-md-5">
					<textarea name="description[{$formLocale|escape}]" id="description" cols="40" rows="5" class="form-control">{$description[$formLocale]|escape}</textarea>
				</div>
			</div>


			{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}
			<div class="separator"></div>
			<div id="access">
				<h3>{translate key="editor.issues.access"}</h3>
				<div class="form-group ">
					<div class="col-md-3  control-label">
						{fieldLabel name="accessStatus" key="editor.issues.accessStatus"}
					</div>
					<div class="col-md-5">
						<select name="accessStatus" id="accessStatus" class="form-control">{html_options options=$accessOptions selected=$accessStatus}</select>

						{fieldLabel name="openAccessDate" key="editor.issues.accessDate"}

						<input type="checkbox" class="form-control"id="enableOpenAccessDate" name="enableOpenAccessDate" {if $openAccessDate}checked="checked" {/if}onchange="document.getElementById('issue').openAccessDateMonth.disabled=this.checked?false:true;document.getElementById('issue').openAccessDateDay.disabled=this.checked?false:true;document.getElementById('issue').openAccessDateYear.disabled=this.checked?false:true;" />&nbsp;{fieldLabel name="enableOpenAccessDate" key="editor.issues.enableOpenAccessDate"}<br/>
						{if $openAccessDate}
						{html_select_date prefix=openAccessDate time=$openAccessDate end_year="+20" all_extra="class=\"selectMenu\""}
						{else}
						{html_select_date prefix=openAccessDate time=$openAccessDate end_year="+20" all_extra="class=\"selectMenu\" disabled=\"disabled\""}
						{/if}
					</div>
				</div>

			</div>
			{/if}

			<div class="separator"></div>
			<div id="cover">
				<h3>{translate key="editor.issues.cover"}</h3>
				<table width="100%" class="data">
<div class="form-group ">
<div class="col-md-9">
					<input type="checkbox" name="showCoverPage[{$formLocale|escape}]" id="showCoverPage" value="1" {if $showCoverPage[$formLocale]} checked="checked"{/if} /> <label for="showCoverPage">{translate key="editor.issues.showCoverPage"}</label>
</div>
</div>

<div class="form-group ">
<div class="col-md-3  control-label">
					{fieldLabel name="coverPage" key="editor.issues.coverPage"}
</div>
<div class="col-md-5">

					<input type="file" name="coverPage" id="coverPage" class="form-control" />&nbsp;&nbsp;{translate key="form.saveToUpload"}<br/>
					{translate key="editor.issues.coverPageInstructions"}
</div>
</div>

<div class="form-group ">
<div class="col-md-3  control-label">
					{fieldLabel name="styleFile" key="editor.issues.styleFile"}
</div>
<div class="col-md-5">
					<input type="file" name="styleFile" id="styleFile" class="form-control" />&nbsp;&nbsp;{translate key="form.saveToUpload"}<br />{translate key="editor.issues.uploaded"}:&nbsp;{if $styleFileName}<a href="javascript:openWindow('{$publicFilesDir}/{$styleFileName|escape}');" class="file">{$originalStyleFileName|escape}</a>&nbsp;<a href="{url op="removeStyleFile" path=$issueId}" onclick="return confirm('{translate|escape:"jsparam" key="editor.issues.removeStyleFile"}')">{translate key="editor.issues.remove"}</a>{else}&mdash;{/if}
</div>
</div>

<div class="form-group ">
<div class="col-md-3  control-label">
					{fieldLabel name="coverPageDescription" key="editor.issues.coverPageCaption"}
</div>
<div class="col-md-5">
					<textarea name="coverPageDescription[{$formLocale|escape}]" id="coverPageDescription" cols="40" rows="5" class="form-control">{$coverPageDescription[$formLocale]|escape}</textarea>
</div>
</div>

<div class="form-group ">
<div class="col-md-3  control-label">
					{fieldLabel name="hideCoverPageArchives" key="editor.issues.coverPageDisplay"}
</div>
<div class="col-md-9">
					<input type="checkbox" name="hideCoverPageArchives[{$formLocale|escape}]" id="hideCoverPageArchives" value="1" {if $hideCoverPageArchives[$formLocale]} checked="checked"{/if} /> <label for="hideCoverPageArchives">{translate key="editor.issues.hideCoverPageArchives"}</label>

</div>
</div><div class="form-group ">
<div class="col-md-9">
					<input type="checkbox" name="hideCoverPageCover[{$formLocale|escape}]" id="hideCoverPageCover" value="1" {if $hideCoverPageCover[$formLocale]} checked="checked"{/if} /> <label for="hideCoverPageCover">{translate key="editor.issues.hideCoverPageCover"}</label>
</div>
</div>
				</div>
				<div class="form-group">
				<div class="col-md-offset-3 col-md-5">
				<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" onclick="document.location.href='{url op="index" escape=false}'" class="button" /></p>
</div>
</div>
		</form>

			{include file="common/footer.tpl"}

