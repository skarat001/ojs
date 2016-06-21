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
<div class="col-md-2 control-label">

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

{fieldLabel name="formLocale" key="form.formLanguage"}

			{url|assign:"issueUrl" op="createIssue" escape=false}
			{form_language_chooser form="issue" url=$issueUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>


{/if}

{fieldLabel name="volume" key="issue.volume"}

<input type="text" name="volume" id="volume" value="{$volume|escape}" size="5" maxlength="5" class="textField" />

{fieldLabel name="number" key="issue.number"}

<input type="text" name="number" id="number" value="{$number|escape}" size="5" maxlength="5" class="textField" />

{fieldLabel name="year" key="issue.year"}

<input type="text" name="year" id="year" value="{$year|escape}" size="5" maxlength="4" class="textField" />


{fieldLabel suppressId="true" name="labelFormat" key="editor.issues.issueIdentification"}</td>

<input type="checkbox" name="showVolume" id="showVolume" value="1"{if $showVolume} checked="checked"{/if} /><label for="showVolume"> {translate key="issue.volume"}</label><br /><input type="checkbox" name="showNumber" id="showNumber" value="1"{if $showNumber} checked="checked"{/if} /><label for="showNumber"> {translate key="issue.number"}</label><br /><input type="checkbox" name="showYear" id="showYear" value="1"{if $showYear} checked="checked"{/if} /><label for="showYear"> {translate key="issue.year"}</label><br /><input type="checkbox" name="showTitle" id="showTitle" value="1"{if $showTitle} checked="checked"{/if} /><label for="showTitle"> {translate key="issue.title"}</label>

	{if $enablePublicIssueId}

{fieldLabel name="publicIssueId" key="editor.issues.publicIssueIdentifier"}

<input type="text" name="publicIssueId" id="publicIssueId" value="{$publicIssueId|escape}" size="20" maxlength="255" class="textField" />

	{/if}

{fieldLabel name="title" key="issue.title"}

<input type="text" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="40" class="textField" />

{fieldLabel name="description" key="editor.issues.description"}

<textarea name="description[{$formLocale|escape}]" id="description" cols="40" rows="5" class="textArea">{$description[$formLocale]|escape}</textarea>

</div>

{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}
<div class="separator"></div>
<div id="access">
<h3>{translate key="editor.issues.access"}</h3>

{fieldLabel name="accessStatus" key="editor.issues.accessStatus"}

<select name="accessStatus" id="accessStatus" class="selectMenu">{html_options options=$accessOptions selected=$accessStatus}</select>

{fieldLabel name="openAccessDate" key="editor.issues.accessDate"}

			<input type="checkbox" id="enableOpenAccessDate" name="enableOpenAccessDate" {if $openAccessDate}checked="checked" {/if}onchange="document.getElementById('issue').openAccessDateMonth.disabled=this.checked?false:true;document.getElementById('issue').openAccessDateDay.disabled=this.checked?false:true;document.getElementById('issue').openAccessDateYear.disabled=this.checked?false:true;" />&nbsp;{fieldLabel name="enableOpenAccessDate" key="editor.issues.enableOpenAccessDate"}<br/>
			{if $openAccessDate}
				{html_select_date prefix=openAccessDate time=$openAccessDate end_year="+20" all_extra="class=\"selectMenu\""}
			{else}
				{html_select_date prefix=openAccessDate time=$openAccessDate end_year="+20" all_extra="class=\"selectMenu\" disabled=\"disabled\""}
			{/if}

</table>
</div>
{/if}

<div class="separator"></div>
<div id="cover">
<h3>{translate key="editor.issues.cover"}</h3>
<table width="100%" class="data">

<input type="checkbox" name="showCoverPage[{$formLocale|escape}]" id="showCoverPage" value="1" {if $showCoverPage[$formLocale]} checked="checked"{/if} /> <label for="showCoverPage">{translate key="editor.issues.showCoverPage"}</label>

{fieldLabel name="coverPage" key="editor.issues.coverPage"}


			<input type="file" name="coverPage" id="coverPage" class="uploadField" />&nbsp;&nbsp;{translate key="form.saveToUpload"}<br/>
			{translate key="editor.issues.coverPageInstructions"}

{fieldLabel name="styleFile" key="editor.issues.styleFile"}

<input type="file" name="styleFile" id="styleFile" class="uploadField" />&nbsp;&nbsp;{translate key="form.saveToUpload"}<br />{translate key="editor.issues.uploaded"}:&nbsp;{if $styleFileName}<a href="javascript:openWindow('{$publicFilesDir}/{$styleFileName|escape}');" class="file">{$originalStyleFileName|escape}</a>&nbsp;<a href="{url op="removeStyleFile" path=$issueId}" onclick="return confirm('{translate|escape:"jsparam" key="editor.issues.removeStyleFile"}')">{translate key="editor.issues.remove"}</a>{else}&mdash;{/if}

{fieldLabel name="coverPageDescription" key="editor.issues.coverPageCaption"}

<textarea name="coverPageDescription[{$formLocale|escape}]" id="coverPageDescription" cols="40" rows="5" class="textArea">{$coverPageDescription[$formLocale]|escape}</textarea>

{fieldLabel name="hideCoverPageArchives" key="editor.issues.coverPageDisplay"}

<input type="checkbox" name="hideCoverPageArchives[{$formLocale|escape}]" id="hideCoverPageArchives" value="1" {if $hideCoverPageArchives[$formLocale]} checked="checked"{/if} /> <label for="hideCoverPageArchives">{translate key="editor.issues.hideCoverPageArchives"}</label>


<input type="checkbox" name="hideCoverPageCover[{$formLocale|escape}]" id="hideCoverPageCover" value="1" {if $hideCoverPageCover[$formLocale]} checked="checked"{/if} /> <label for="hideCoverPageCover">{translate key="editor.issues.hideCoverPageCover"}</label>

</div>
<p><input type="submit" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" onclick="document.location.href='{url op="index" escape=false}'" class="button" /></p>

</form>

{include file="common/footer.tpl"}

