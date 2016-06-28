{**
	* templates/manager/languageSettings.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Form to edit journal language settings.
	*
	*}
	{strip}
	{assign var="pageTitle" value="common.languages"}
	{include file="common/header.tpl"}
	{/strip}

	<p><span class="instruct">{translate key="manager.languages.languageInstructions"}</span></p>

	{include file="common/formErrors.tpl"}

	{if count($availableLocales) > 1}
	<form method="post" action="{url op="saveLanguageSettings"}" class="form-horizontal">
		<div class="form-group">
			<div class="col-md-3 col-sm-3 control-label">
				{fieldLabel name="primaryLocale" required="true" key="locale.primary"}
			</div>
			<div class="col-md-7 col-sm-7">
				<select id="primaryLocale" name="primaryLocale" size="1" class="form-control">
					{html_options options=$availableLocales selected=$primaryLocale}
				</select>
			</div>
		</div>

		<div class="row">
			<span class="instruct">{translate key="manager.languages.primaryLocaleInstructions"}</span>
		</div>

		<div class="row">
			<div class="col-md-3 col-sm-3">
				{fieldLabel suppressId="true" name="supportedLocales" key="locale.supported"}
			</div>
			<div class="col-md-7 col-sm-7">

				<table class="table table-striped" width="100%">
					<thead>
						<tr valign="top">
							<th width="20%">&nbsp;</th>
							<th align="center" width="10%">{translate key="manager.language.ui"}</th>
							<th align="center" width="20%">{translate key="manager.language.submissions"}</th>
							<th align="center" width="10%">{translate key="manager.language.forms"}</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$availableLocales key=localeKey item=localeName}
						<tr>
							<td>{$localeName|escape}</td>
							<td align="center"><input type="checkbox" name="supportedLocales[]" value="{$localeKey|escape}"{if in_array($localeKey, $supportedLocales)} checked="checked"{/if}/></td>
							<td align="center"><input type="checkbox" name="supportedSubmissionLocales[]" value="{$localeKey|escape}"{if in_array($localeKey, $supportedSubmissionLocales)} checked="checked"{/if}/></td>
							<td align="center"><input type="checkbox" name="supportedFormLocales[]" value="{$localeKey|escape}"{if in_array($localeKey, $supportedFormLocales)} checked="checked"{/if}/></td>
							<td><a href="{url op="reloadLocalizedDefaultSettings" localeToLoad=$localeKey}" onclick="return confirm('{translate|escape:"jsparam" key="manager.language.confirmDefaultSettingsOverwrite"}')" class="action">{translate key="manager.language.reloadLocalizedDefaultSettings"}</a></td>
						</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
		</div>

		{translate key="manager.languages.supportedLocalesInstructions"}</span>

	</table>
	<div class="form-group">
		<div class="col-md-offset-3 col-sm-offset-3">
		<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="manager"}'" /></p>
		</div>
	</div>
	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{else}
<div class="separator"></div>
<p><span class="instruct">{translate key="manager.languages.noneAvailable"}</span></p>
{/if}

{include file="common/footer.tpl"}

