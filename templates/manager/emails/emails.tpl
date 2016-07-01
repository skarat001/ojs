{**
 * templates/manager/emails/emails.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of email templates in journal management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.emails"}
{include file="common/header.tpl"}
{/strip}

<br/>

<div id="emails">
	<form action="{url op="exportEmails"}" method="post" id="emailsForm">
		<table class="table table-striped" width="100%">
			<thead>
			<tr class="heading" valign="bottom">
				<th width="15%">{translate key="manager.emails.emailTemplates"}</th>
				<th width="10%">{translate key="email.sender"}</th>
				<th width="10%">{translate key="email.recipient"}</th>
				<th width="35%">{translate key="email.subject"}</th>
				<th width="30%" align="right">{translate key="common.action"}</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
		{iterate from=emailTemplates item=emailTemplate}
			<tr valign="top">
				<td>
					{url|assign:"emailUrl" op="email" template=$emailTemplate->getEmailKey()}
					{$emailTemplate->getEmailKey()|escape|replace:"_":" "}&nbsp;{icon name="mail" url=$emailUrl}
				</td>
				<td>{translate key=$emailTemplate->getFromRoleName()}</td>
				<td>{translate key=$emailTemplate->getToRoleName()}</td>
				<td>{$emailTemplate->getSubject()|escape|truncate:50:"..."}</td>
				<td  >
					<a href="{url op="editEmail" path=$emailTemplate->getEmailKey()}" class="btn btn-warning btn-xs">{translate key="common.edit"}</a>
					{if $emailTemplate->getCanDisable() && !$emailTemplate->isCustomTemplate()}
						{if $emailTemplate->getEnabled() == 1}
							&nbsp;<a href="{url op="disableEmail" path=$emailTemplate->getEmailKey()}" class="btn btn-warning btn-xs">{translate key="manager.emails.disable"}</a>
						{else}
							&nbsp;<a href="{url op="enableEmail" path=$emailTemplate->getEmailKey()}" class="btn btn-warning btn-xs ">{translate key="manager.emails.enable"}</a>
						{/if}
					{/if}
					{if $emailTemplate->isCustomTemplate()}
						&nbsp;<a href="{url op="deleteCustomEmail" path=$emailTemplate->getEmailKey()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.emails.confirmDelete"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a><br />
					{else}
						&nbsp;<a href="{url op="resetEmail" path=$emailTemplate->getEmailKey()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.emails.confirmReset"}')" class="btn btn-info btn-xs">{translate key="manager.emails.reset"}</a><br />
					{/if}
				</td>
				<td><input type="checkbox" name="tplId[]" value="{$emailTemplate->getEmailKey()}" /></td>
			</tr>
			
		{/iterate}
		{if $emailTemplates->wasEmpty()}
			<tr>
				<td colspan="5" class="nodata">{translate key="common.none"}</td>
			</tr>
		
		{else}
			<tr>
				<td colspan="3" align="left">{page_info iterator=$emailTemplates}</td>
				<td align="right" colspan="2">{page_links anchor="emails" name="emails" iterator=$emailTemplates}</td>
			</tr>
		{/if}
		</tbody>
		</table>
		<br />
		<p>
			<input type='submit' value="{translate key="manager.emails.exportXML"}" class='btn btn-primary' />
		</p>

	</form>

	<form id="email_upload" name="email_upload" action="{url op="uploadEmails"}" method="post" enctype="multipart/form-data" class="form-inline">
		<p>
		<div class="form-group">
			<input id="uploader" name="email_file" type="file" class="form-control" />
			<input type="submit" value="{translate key="manager.emails.uploadXML"}" class="btn btn-primary" />
			</div>
		</p>
	</form>

	<a href="{url op="createEmail"}" class="action">{translate key="manager.emails.createEmail"}</a><br />
	<a href="{url op="resetAllEmails"}" onclick="return confirm('{translate|escape:"jsparam" key="manager.emails.confirmResetAll"}')" class="action">{translate key="manager.emails.resetAll"}</a>

</div>
{include file="common/footer.tpl"}