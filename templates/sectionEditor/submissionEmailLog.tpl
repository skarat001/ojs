{**
 * templates/sectionEditor/submissionEmailLog.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show submission email log page.
 *
 *
 *}
{strip}
{assign var="pageTitle" value="submission.emailLog"}
{include file="common/header.tpl"}
{/strip}

<ul class="nav nav-pills">
	<li class="nav-item "><a href="{url op="submission" path=$submission->getId()}" class="nav-link">{translate key="submission.summary"}</a></li>
	{if $canReview}<li class="nav-item "><a href="{url op="submissionReview" path=$submission->getId()}" class="nav-link">{translate key="submission.review"}</a></li>{/if}
	{if $canEdit}<li class="nav-item "><a href="{url op="submissionEditing" path=$submission->getId()}" class="nav-link">{translate key="submission.editing"}</a></li>{/if}
	<li class="nav-item active"><a href="{url op="submissionHistory" path=$submission->getId()}" class="nav-link">{translate key="submission.history"}</a></li>
	<li class="nav-item"><a href="{url op="submissionCitations" path=$submission->getId()}" class="nav-link">{translate key="submission.citations"}</a></li>
</ul>
<hr>


{include file="sectionEditor/submission/summary.tpl"}

<div class="separator"></div>

<div id="emailLogEntries">
<h3>{translate key="submission.history.submissionEmailLog"}</h3>

<table width="100%" class="table table-striped">
	<thead>
	<tr valign="top" class="heading">
		<th width="15%">{translate key="common.date"}</th>
		<th width="15%">{translate key="email.sender"}</th>
		<th width="20%">{translate key="email.recipients"}</th>
		<th>{translate key="common.subject"}</th>
		<th width="15%" align="right">{translate key="common.action"}</th>
	</tr>
	</thead>
	<tbody>
{iterate from=emailLogEntries item=logEntry}
	<tr valign="top">
		<td>{$logEntry->getDateSent()|date_format:$dateFormatShort}</td>
		<td>{$logEntry->getFrom()|truncate:40:"..."|escape}</td>
		<td>{$logEntry->getRecipients()|truncate:40:"..."|escape}</td>
		<td>{$logEntry->getSubject()|truncate:60:"..."|escape}</td>
		<td align="right"><a href="{url op="submissionEmailLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="btn btn-info btn-xs">{translate key="common.view"}</a>{if $isEditor}&nbsp;|&nbsp;<a href="{url page="editor" op="clearSubmissionEmailLog" path=$submission->getId()|to_array:$logEntry->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.email.confirmDeleteLogEntry"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a>{/if}</td>
	</tr>
	
{/iterate}
{if $emailLogEntries->wasEmpty()}
	<tr valign="top">
		<td colspan="5" class="nodata">{translate key="submission.history.noLogEntries"}</td>
	</tr>
	
{else}
	<tr>
		<td colspan="3" align="left">{page_info iterator=$emailLogEntries}</td>
		<td colspan="2" align="right">{page_links anchor="emailLogEntries" name="emailLogEntries" iterator=$emailLogEntries}</td>
	</tr>
{/if}
</tbody>
</table>

{if $isEditor}
<a class="btn btn-danger" href="{url page="editor" op="clearSubmissionEmailLog" path=$submission->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.email.confirmClearLog"}')">{translate key="submission.history.clearLog"}</a>
{/if}
</div>
{include file="common/footer.tpl"}

