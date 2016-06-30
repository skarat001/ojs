{**
 * templates/admin/languages.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to edit site language settings.
 *
 *}
{strip}
{assign var="pageTitle" value="common.languages"}
{include file="common/header.tpl"}
{/strip}

<form method="post" action="{url op="saveLanguageSettings"}" class="form-horizontal">
<div id="languageSettings">
<h3>{translate key="admin.languages.languageSettings"}</h3>
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{translate key="locale.primary"}
</div>
<div class="col-md-7 col-sm-7">
		<select name="primaryLocale" id="primaryLocale" size="1" class="form-control">
		{foreach from=$installedLocales item=localeKey}
			<option value="{$localeKey|escape}"{if $localeKey == $primaryLocale} selected="selected"{/if}>{$localeNames.$localeKey|escape}</option>
		{/foreach}
		</select>
		<br />
		<span class="instruct">{translate key="admin.languages.primaryLocaleInstructions"}</span>
	</div>
	</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{translate key="locale.supported"}
</div>
<div class="col-md-7 col-sm-7">
		{foreach from=$installedLocales item=localeKey}
		<div class="form-group">
		<div class="checkbox">
		<label for="supportedLocales-{$localeKey|escape}">
		<input type="checkbox" name="supportedLocales[]" id="supportedLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $supportedLocales)} checked="checked"{/if} />

				{$localeNames.$localeKey|escape}</label>
				{if !$localesComplete[$localeKey]}
					<span class="formError">*</span>
					{assign var=incompleteLocaleFound value=1}
				{/if}
		</div>
		</div>

		{/foreach}
	

		<span class="instruct">{translate key="admin.languages.supportedLocalesInstructions"}</span>
		{if $incompleteLocaleFound}
			<br/>
			<span class="formError">*</span>&nbsp;{translate key="admin.locale.maybeIncomplete"}
		{/if}{* $incompleteLocaleFound *}

	</div>
	</div>
</div>
<div class="form-group">
<div class="col-md-offset-3 col-sm-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="admin" escape=false}'" /></p>
</div>
</div>
</form>

<div class="separator"></div>

<form method="post" action="{url op="installLocale"}">
<div id="installLanguages">
<h3>{translate key="admin.languages.installLanguages"}</h3>
<h4>{translate key="admin.languages.installedLocales"}</h4>
<table class="data" width="100%">
{foreach from=$installedLocales item=localeKey}
<tr valign="top">
	<td width="30%">&bull;&nbsp;{$localeNames.$localeKey|escape} ({$localeKey|escape})</td>
	<td width="70%"><a href="{url op="reloadLocale" locale=$localeKey}" onclick="return confirm('{translate|escape:"jsparam" key="admin.languages.confirmReload"}')" class="action">{translate key="admin.languages.reload"}</a>&nbsp;|&nbsp;<a href="{url op="reloadDefaultEmailTemplates" locale=$localeKey}" class="action">{translate key="admin.languages.reloadDefaultEmailTemplates"}</a>{if $localeKey != $primaryLocale}&nbsp;|&nbsp;<a href="{url op="uninstallLocale" locale=$localeKey}" onclick="return confirm('{translate|escape:"jsparam" key="admin.languages.confirmUninstall"}')" class="action">{translate key="admin.languages.uninstall"}</a>{/if}</td>
</tr>
{/foreach}
</table>
</div>
<div id="installNewLocales">
<h4>{translate key="admin.languages.installNewLocales"}</h4>
<p>{translate key="admin.languages.installNewLocalesInstructions"}</p>
{assign var=incompleteLocaleFound value=0}
{foreach from=$uninstalledLocales item=localeKey}
<input type="checkbox" name="installLocale[]" id="installLocale-{$localeKey|escape}" value="{$localeKey|escape}" /> <label for="installLocale-{$localeKey|escape}">{$localeNames.$localeKey|escape} ({$localeKey|escape})</label>
{if !$localesComplete[$localeKey]}
	<span class="formError">*</span>
	{assign var=incompleteLocaleFound value=1}
{/if}
<br />
{foreachelse}
{assign var="noLocalesToInstall" value="1"}
<span class="nodata">{translate key="admin.languages.noLocalesAvailable"}</span>
{/foreach}
{if $incompleteLocaleFound}
	<br />
	<span class="formError">*</span>&nbsp;{translate key="admin.locale.maybeIncomplete"}
{/if}{* $incompleteLocaleFound *}

{if not $noLocalesToInstall}
<div class="form-group">
<div class="col-md-offset-3 col-sm-offset-3">
<p><input type="submit" value="{translate key="admin.languages.installLocales"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="admin" escape=false}'" /></p>
</div>
</div>
{/if}
</div>
</form>

<div class="separator"></div>
<div id="downloadLocales">
<h3>{translate key="admin.languages.downloadLocales"}</h3>

{if $downloadAvailable}

<table class="data" width="100%">
	{foreach from=$downloadableLocales item=downloadableLocale}
		<tr valign="top">
			<td width="30%">&bull;&nbsp;{$downloadableLocale.name|escape} ({$downloadableLocale.key})</td>
			<td width="70%">
				<a href="{url op="downloadLocale" locale=$downloadableLocale.key}" class="action">{translate key="admin.languages.download"}</a>
			</td>
		</tr>
	{foreachelse}
		<tr valign="top">
			<td colspan="4" class="nodata">{translate key="common.none"}</td>
		</tr>
	{/foreach}
</table>
{else}{* not $downloadAvailable *}
	{translate key="admin.languages.downloadUnavailable"}
{/if}{* $downloadAvailable *}
</div>
{include file="common/footer.tpl"}

