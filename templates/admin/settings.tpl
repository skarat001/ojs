{**
 * templates/admin/settings.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site settings form.
 *
 *}
{strip}
{assign var="pageTitle" value="admin.siteSettings"}
{include file="common/header.tpl"}
{/strip}

<form id="settings" method="post" action="{url op="saveSettings"}" enctype="multipart/form-data" class="form-horizontal">
{include file="common/formErrors.tpl"}

{if count($formLocales) > 1}
<div class="form-group">
<div class="col-md-3 col-sm-3">
{fieldLabel name="formLocale" key="form.formLanguage"}
</div>
<div class="col-md-7 col-sm-7">
			{url|assign:"settingsUrl" op="settings" escape=false}
			{form_language_chooser form="settings" url=$settingsUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
</div>
</div>

{/if}
	
	<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="title" key="admin.settings.siteTitle" required="true"}
</div>
<div class="col-md-7 col-sm-7">
			<input type="radio" name="pageHeaderTitleType[{$formLocale|escape}]" id="pageHeaderTitleType-0" value="0"{if not $pageHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="pageHeaderTitleType-0" key="manager.setup.useTextTitle"}


			<input type="text" id="title" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" size="40" maxlength="120" class="form-control" />
</div>
</div>

<div class="form-group">
<div class="col-md-3 col-sm-3">
<input type="radio" name="pageHeaderTitleType[{$formLocale|escape}]" id="pageHeaderTitleType-1" value="1"{if $pageHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="pageHeaderTitleType-1" key="manager.setup.useImageTitle"}
</div>
<div class="col-md-7 col-sm-7">
<input type="file" name="pageHeaderTitleImage" id="pageHeaderTitleImage" class="form-control" /> 
	{if $pageHeaderTitleType[$formLocale] && $pageHeaderTitleImage[$formLocale]}
				{translate key="common.fileName"}: {$pageHeaderTitleImage[$formLocale].originalFilename|escape} {$pageHeaderTitleImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deletePageHeaderTitleImage" value="{translate key="common.delete"}" class="btn btn-danger" />
				<br />
				<img src="{$publicFilesDir}/{$pageHeaderTitleImage[$formLocale].uploadName|escape:"url"}" width="{$pageHeaderTitleImage[$formLocale].width|escape}" height="{$pageHeaderTitleImage[$formLocale].height|escape}" style="border: 0;" alt="{translate key="admin.settings.homeHeaderImage.altText"}" />
			{/if}
			</div>
			<div class="col-md-2 col-sm-2">

<input type="submit" name="uploadPageHeaderTitleImage" value="{translate key="common.upload"}" class="btn btn-primary" />

		
	</div>
</div>

	{if $pageHeaderTitleType[$formLocale] && $pageHeaderTitleImage[$formLocale]}
<div class="form-group">
<div class="col-md-3 col-sm-3">
{fieldLabel name="pageHeaderTitleImageAltText" key="common.altText"}
</div>
<div class="col-md-7 col-sm-7">
				<input type="text" id="pageHeaderTitleImageAltText" name="pageHeaderTitleImageAltText[{$formLocale|escape}]" value="{$pageHeaderTitleImage[$formLocale].altText|escape}" size="40" maxlength="255" class="form-control" />
		
		<span class="instruct">{translate key="common.altTextInstructions"}</span>
</div>
</div>
	{/if}
	<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="intro" key="admin.settings.introduction"}
	</div>
<div class="col-md-7 col-sm-7">
	<textarea name="intro[{$formLocale|escape}]" id="intro" cols="40" rows="10" class="textArea">{$intro[$formLocale]|escape}</textarea>
</div>
</div>

<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="redirect" key="admin.settings.journalRedirect"}
</div>
<div class="col-md-7 col-sm-7">
			<select name="redirect" id="redirect" size="1" class="form-control">
				<option value="">{translate key="admin.settings.noJournalRedirect"}</option>
				{html_options options=$redirectOptions selected=$redirect}
			</select>
	
	<span class="instruct">{translate key="admin.settings.journalRedirectInstructions"}</span>
</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="aboutField" key="admin.settings.aboutDescription"}
	</div>
<div class="col-md-7 col-sm-7">
	<textarea name="about[{$formLocale|escape}]" id="aboutField" cols="40" rows="10" class="textArea">{$about[$formLocale]|escape}</textarea>
</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="contactName" key="admin.settings.contactName" required="true"}
	</div>
<div class="col-md-7 col-sm-7">
	<input type="text" id="contactName" name="contactName[{$formLocale|escape}]" value="{$contactName[$formLocale]|escape}" size="40" maxlength="90" class="form-control" />
</div>
</div>

<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="contactEmail" key="admin.settings.contactEmail" required="true"}
	</div>
<div class="col-md-7 col-sm-7">
	<input type="text" id="contactEmail" name="contactEmail[{$formLocale|escape}]" value="{$contactEmail[$formLocale]|escape}" size="40" maxlength="90" class="form-control" />
</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3">
	{fieldLabel name="minPasswordLength" key="admin.settings.minPasswordLength" required="true"}
	</div>
<div class="col-md-5 col-sm-5">
	<input type="text" id="minPasswordLength" name="minPasswordLength" value="{$minPasswordLength|escape}" size="4" maxlength="2" class="form-control" /> {fieldLabel name="oneStepReset" key="admin.settings.oneStepReset"}
</div>
<div class="col-md-3 col-sm-3">
	{translate key="admin.settings.passwordCharacters"}<br/>

</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3 checkbox">
<label for="siteTheme">
		<input type="checkbox" id="oneStepReset" name="oneStepReset" {if $oneStepReset}checked="checked" {/if}/>

	<b>{translate key="admin.settings.siteTheme"}</b></label></td>
	</div>
<div class="col-md-7 col-sm-7">

	
			<select name="siteTheme" class="form-control" id="siteTheme"{if empty($themes)} disabled="disabled"{/if}>
				<option value="">{translate key="common.none"}</option>
				{foreach from=$themes key=path item=themePlugin}
					<option value="{$path|escape}"{if $path == $siteTheme} selected="selected"{/if}>{$themePlugin->getDisplayName()|escape}</option>
				{/foreach}
			</select>
		</div>
		</div>
<div class="form-group">
<div class="col-md-3 col-sm-3">
	<label for="siteStyleSheet">{translate key="admin.settings.siteStyleSheet"}</label>
</div>
<div class="col-md-7 cl-sm-7">
			<input type="file" name="siteStyleSheet" class="form-control" id="siteStyleSheet" />
{if $siteStyleFileExists}
				<br />
				{translate key="common.fileName"}: <a href="{$publicFilesDir}/{$styleFilename}" class="file">{$originalStyleFilename|escape}</a> {$dateStyleFileUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteSiteStyleSheet" value="{translate key="common.delete"}" class="btn btn-danger" />
			{/if}
			</div>
<div class="col-md-2 cl-sm-2">
			 <input type="submit" name="uploadSiteStyleSheet" value="{translate key="common.upload"}" class="btn btn-primary" />
			
	</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3">
	<label>{translate key="admin.settings.options"}</label>
	</div>
<div class="col-md-7 cl-sm-7 checkbox">
			<label><input type="checkbox" id="useAlphalist" name="useAlphalist" {if $useAlphalist}checked="checked" {/if}/>
			{translate key="admin.settings.useAlphalist"}
			</label>
	</div>
</div>
<table>
	<tr valign="top">
		<td class="value" colspan="2">
			<input type="checkbox" id="usePaging" name="usePaging" {if $usePaging}checked="checked" {/if}/>
			{fieldLabel name="usePaging" key="admin.settings.usePaging"}
		</td>
	</tr>
	<tr valign="top">
	<td >{translate key="admin.settings.journalsList"}</td>
		<td colspan="2" class="value">
			{translate key="admin.settings.journalsList.description"}<br />
			<input type="checkbox" name="showThumbnail" id="showThumbnail" value="1"{if $showThumbnail} checked="checked"{/if} />
			{fieldLabel name="showThumbnail" key="admin.settings.journalsList.showThumbnail"}<br />
			<input type="checkbox" name="showTitle" id="showTitle" value="1"{if $showTitle} checked="checked"{/if} />
			{fieldLabel name="showTitle" key="admin.settings.journalsList.showTitle"}<br />
			<input type="checkbox" name="showDescription" id="showDescription" value="1"{if $showDescription} checked="checked"{/if} />
			{fieldLabel name="showDescription" key="admin.settings.journalsList.showDescription"}<br />
		</td>
	</tr>
	<tr valign="top">
	<td >{translate key="admin.settings.security"}</td>
		<td colspan="2" class="value checkbox">
			<label>
			<input type="checkbox" name="preventManagerPluginManagement" id="preventManagerPluginManagement" value="1"{if $preventManagerPluginManagement} checked="checked"{/if} />
			{translate key="admin.settings.security.plugins"}</label><br />
		</td>
	</tr>
</table>

<br />
<div id="oaiRegistration">
	<h4>{translate key="admin.settings.oaiRegistration"}</h4>

	{url|assign:"oaiUrl" page="oai"}
	{url|assign:"siteUrl" page="index"}
	<p>{translate key="admin.settings.oaiRegistrationDescription" siteUrl=$siteUrl oaiUrl=$oaiUrl}</p>
</div>

{if count($availableMetricTypes) > 2}
	<br />
	<div id="defaultMetricSelection">
		<h4>{translate key="defaultMetric.title"}</h4>
		<p>{translate key="admin.settings.defaultMetricDescription"}</p>
		<table class="data" width="100%">
			<tr valign="top">
				<td width="20%" class="label">{fieldLabel name="defaultMetricType" key="defaultMetric.availableMetrics"}</td>
				<td colspan="2" width="80%" class="value">
					<select name="defaultMetricType" class="form-control" id="defaultMetricType">
						{foreach from=$availableMetricTypes key=metricType item=displayName}
							<option value="{$metricType|escape}"{if $metricType == $defaultMetricType} selected="selected"{/if}>{$displayName|escape}</option>
						{/foreach}
					</select>
				</td>
			</tr>
		</table>
	</div>
{/if}
<div class="col-md-offet-3 col-sm-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="admin" escape=false}'" /></p>
</div>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{include file="common/footer.tpl"}

