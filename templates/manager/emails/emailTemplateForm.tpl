{**
 * templates/manager/emails/emailTemplateForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Basic journal settings under site administration.
 *
 *}
{strip}
{if !$isNewTemplate}
	{assign var="pageTitle" value="manager.emails.editEmail"}
{else}
	{assign var="pageTitle" value="manager.emails.createEmail"}
{/if}
{include file="common/header.tpl"}
{/strip}
<div id="emailTemplateForm">
<form method="post" action="{url op="updateEmail"}" class="form-horizontal">
<input type="hidden" name="emailId" value="{$emailId|escape}" />
<input type="hidden" name="journalId" value="{$journalId|escape}" />
{if !$isNewTemplate}
	<input type="hidden" name="emailKey" value="{$emailKey|escape}" />
{/if}

{if $description}
	<p>{$description|escape}</p>
{/if}

<br/>

{include file="common/formErrors.tpl"}



{if $isNewTemplate}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="emailKey" key="manager.emails.emailKey"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="emailKey" value="{$emailKey|escape}" id="emailKey" size="20" maxlength="120" class="form-control" />
	</div>
	</div>
{/if}

{foreach from=$supportedLocales item=localeName key=localeKey}


		<h3>{translate key="manager.emails.emailTemplate"} ({$localeName|escape})</h3>
	

<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">

{fieldLabel name="subject-$localeKey" key="email.subject"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="subject[{$localeKey|escape}]" id="subject-{$localeKey|escape}" value="{$subject.$localeKey|escape}" size="70" maxlength="120" class="form-control" />
	</div>
	</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="body-$localeKey" key="email.body"}
</div>
<div class="col-md-7 col-sm-7">
<textarea name="body[{$localeKey|escape}]" id="body-{$localeKey|escape}" cols="70" rows="20" class="form-control">{$body.$localeKey|escape}</textarea>
	</div>
	</div>
{foreachelse}


	<h3>{translate key="manager.emails.emailTemplate"}</h3>

<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="subject-$currentLocale" key="email.subject"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="subject[{$currentLocale|escape}]" id="subject-{$currentLocale|escape}" value="{$subject.$currentLocale|escape}" size="70" maxlength="120" class="form-control" />
	</div>
	</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="body-$currentLocale" key="email.body"}
</div>
<div class="col-md-7 col-sm-7">
<textarea name="body[{$currentLocale|escape}]" id="body-{$currentLocale|escape}" cols="70" rows="20" class="form-control">{$body.$currentLocale|escape}</textarea>
	</div>
	</div>
{/foreach}



{if $canDisable}
<div class="form-group">
<div class="col-md-10 col-sm-10 checkbox">
<p><label for="emailEnabled"><input type="checkbox" name="enabled" id="emailEnabled" value="1"{if $enabled} checked="checked"{/if} /> {translate key="manager.emails.enabled"}</label></p>
	</div>
	</div>
{/if}
<div class="form-group">
<div class="col-md-offset-3 col-sm-offset-3">
<input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="emails" escape=false}'" /> <input type="reset" class="btn btn-info" />
</div>
</div>
</form>
</div>
{include file="common/footer.tpl"}

